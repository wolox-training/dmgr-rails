# frozen_string_literal: true

class BookShowSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :publisher, :year, :genre
  attribute :image, key: :image_url

  has_many :rent, key: :actual_rent, serializer: BookRentSerializer do
    object.rent.where('end_date > ?', Time.zone.now).where('start_date < ?', Time.zone.now).last
  end
end
