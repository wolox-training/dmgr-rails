# frozen_string_literal: true

class BookSugestion < ApplicationRecord
  validates :author, :title, :link, presence: true

  has_one :user, dependent: :nullify
end
