# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :from, :to, presence: true

  # validate :book_is_available
  #
  # def book_is_available
  #   book.rent.where('? < to',book.rent.from).where('? > from',book.rent.to).empty?
  # end
end
