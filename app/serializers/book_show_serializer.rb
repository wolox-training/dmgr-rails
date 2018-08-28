# frozen_string_literal: true

class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :year, :genre
  attribute :image, key: :image_url

  has_many :rent, key: :actual_rent, serializer: BookRentSerializer do
    @lastRent = object.rent.last
    @lastRent if Time.zone.now > @lastRent.from && Time.zone.now < @lastRent.to
  end
end
