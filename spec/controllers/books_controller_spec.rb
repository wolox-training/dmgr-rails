# frozen_string_literal: true

require 'rails_helper'
require 'controllers/authenticated_user'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the book' do
      let(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with the books jsons' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book that exist without rents' do
      let(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response.body).to eq BookShowSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responses with a book without rents' do
        expect(ActiveSupport::JSON.decode(response.body)['actual_rent']).to be_nil
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When fetching a book that exist with a rent that is not current' do
      let(:book) { create(:book) }

      let!(:rent) { create(:rent, book: book, user: user, start_date: Time.zone.now - 20.months \
        , end_date: Time.zone.now - 10.months) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with a book without rents' do
        expect(ActiveSupport::JSON.decode(response.body)['actual_rent']).to be_nil
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When fetching a book that exist with a rent that is current' do
      let(:book) { create(:book) }

      let!(:rent) do
        create(:rent, book: book, user: user, start_date: Time.zone.now - 10.months \
          , end_date: Time.zone.now + 10.months)
      end

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response.body).to eq BookShowSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responses with a book with rents' do
        expect(ActiveSupport::JSON.decode(response.body)['actual_rent']).not_to be_nil
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When fetching a book that does not exist' do
      before do
        get :show, params: { id: 1 }
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
