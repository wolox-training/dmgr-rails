# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BookSugestionsController, type: :controller do
  describe 'POST #create' do
    subject(:create_book_sugestion) { post :create, params: { book_sugestion: attributes } }
    context 'When creating a valid book sugestion' do
      let(:attributes) { FactoryBot.attributes_for(:book_sugestion) }

      it 'creates a new book sugestion' do
        expect { create_book_sugestion }.to change { BookSugestion.count }.by(1)
      end

      it 'responds with 302 status' do
        create_book_sugestion
        expect(response).to have_http_status(:found)
      end
    end

    context 'When creating an invalid user rent' do
      let(:attributes) { FactoryBot.attributes_for(:book_sugestion, author: nil) }

      it 'doesn\'t create a new rent' do
        expect { create_book_sugestion }.to change { BookSugestion.count }.by(0)
      end

      it 'responds with 400 status' do
        create_book_sugestion
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
