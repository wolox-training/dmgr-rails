# frozen_string_literal: true

module Api
  module V1
    class BookSugestionsController < Api::V1::ApiController
      include Wor::Paginate

      def create
        book_sugestion = BookSugestion.new(create_params_sanitized)

        if book_sugestion.save
          render json: book_sugestion, status: :found
        else
          render json: book_sugestion.errors.messages, status: :bad_request
        end
      end

      private

      def create_params_sanitized
        params.require(:book_sugestion).permit(:editorial, :price, :author, :title, :link, :publisher, :year)
      end
    end
  end
end
