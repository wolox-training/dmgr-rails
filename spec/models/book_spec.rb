# frozen_string_literal: true

require 'rails_helper'

describe Book do
  describe '#create' do
    context 'When everything is normal' do
      it 'creates a valid book' do
        book = create(:book)
        expect(book).to be_valid
      end
    end

    %i[genre author image title publisher year].each do |field|
      context "When the #{field} is nil" do
        it 'builds an invalid book' do
          book = build(:book, field => nil)
          expect(book).to be_invalid
        end
      end
    end
  end
end
