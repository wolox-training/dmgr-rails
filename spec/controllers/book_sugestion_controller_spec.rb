require 'rails_helper'

describe Api::V1::BookSugestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book sugestion' do
      let!(:new_book_sugestion_attributes) { FactoryBot.attributes_for(:book_sugestion) }

      it 'creates a new book sugestion' do
        expect do
          post :create, params: { book_sugestion: new_book_sugestion_attributes }
        end.to change { BookSugestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_sugestion: new_book_sugestion_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid user rent' do
      let!(:new_book_sugestion_attributes) { FactoryBot.attributes_for(:book_sugestion, author: nil) }

      before do
          post :create, params: { book_sugestion: new_book_sugestion_attributes }
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { book_sugestion: new_book_sugestion_attributes }
        end.to change { BookSugestion.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
