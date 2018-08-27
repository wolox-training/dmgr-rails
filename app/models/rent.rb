# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :from, :to, presence: true
end
