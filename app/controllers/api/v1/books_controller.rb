module Api
  module V1
    class BooksController < Api::V1::ApiController

      include Wor::Paginate

      def index
        render_paginated Book.all
      end

      def show
        @book = Book.find(params[:id])
        render json: @book, serializer: BookShowSerializer, status: :ok
      end
    end
  end
end
