# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BookSugestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book sugestion' do
      let!(:attributes) { FactoryBot.attributes_for(:book_sugestion) }

      it 'creates a new book sugestion' do
        expect do
          post :create, params: { book_sugestion: attributes }
        end.to change { BookSugestion.count }.by(1)
      end

      it 'responds with 302 status' do
        post :create, params: { book_sugestion: attributes }
        expect(response).to have_http_status(:found)
      end
    end

    context 'When creating an invalid user rent' do
      let!(:attributes) { FactoryBot.attributes_for(:book_sugestion, author: nil) }

      before do
        post :create, params: { book_sugestion: attributes }
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { book_sugestion: attributes }
        end.to change { BookSugestion.count }.by(0)
      end

      it 'responds with 400 status' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
