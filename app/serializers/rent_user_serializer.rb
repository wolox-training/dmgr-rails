# frozen_string_literal: true

class RentUserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
end
