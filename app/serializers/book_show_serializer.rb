# frozen_string_literal: true

class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :year, :genre
  attribute :image, key: :image_url

  has_many :rent, key: :actual_rent, serializer: BookRentSerializer do
    @last_rent = object.rent.last
    if (Time.zone.now > @last_rent.from && Time.zone.now < @last_rent.to) then
       @last_rent
    end
  end
end
