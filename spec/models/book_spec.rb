require 'rails_helper'

describe Book do
  it do
    should validate_presence_of(:genre)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:image)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:publisher)
  end

  it do
    should validate_presence_of(:year)
  end

  describe '#create' do
    context 'When everything is normal' do
      it do
        book = create(:book)
        expect(book).to be_valid
      end
    end

    context 'When the genre is nil' do
      it do
        book = build(:book, genre: nil)
        expect(book).to be_invalid
      end
    end

    context 'When the author is nil' do
      it do
        book = build(:book, author: nil)
        expect(book).to be_invalid
      end
    end

    context 'When the image is nil' do
      it do
        book = build(:book, image: nil)
        expect(book).to be_invalid
      end
    end

    context 'When the title is nil' do
      it do
        book = build(:book, title: nil)
        expect(book).to be_invalid
      end
    end

    context 'When the publisher is nil' do
      it do
        book = build(:book, publisher: nil)
        expect(book).to be_invalid
      end
    end

    context 'When the year is nil' do
      it do
        book = build(:book, year: nil)
        expect(book).to be_invalid
      end
    end
  end
end
