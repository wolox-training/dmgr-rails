# frozen_string_literal: true

class RentBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre
  attribute :image, key: :image_url
end
