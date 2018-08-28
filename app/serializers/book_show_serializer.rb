# frozen_string_literal: true

class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :year, :genre
  attribute :image, key: :image_url

  has_one :rent, key: :actual_rent, serializer: BookRentSerializer
end
