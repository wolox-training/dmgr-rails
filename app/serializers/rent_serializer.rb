# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :book, :user

  has_one :book, serializer: RentBookSerializer
  has_one :user, serializer: RentUserSerializer
end
