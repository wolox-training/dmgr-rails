# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, :start_date, :end_date, presence: true

  validate :book_is_available

  def book_is_available
    return if book.rent.where('end_date > ?', start_date).where('start_date < ?', end_date).empty?
    errors.add(:not_available, 'book is already booked')
  end
end
