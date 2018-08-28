# frozen_string_literal: true

class BookRentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book_id, :user_id
end
