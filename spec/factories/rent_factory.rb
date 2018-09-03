# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    user { create(:user) }
    book { create(:book) }
    start_date { Faker::Time.between(Time.zone.now - 1000.months, Time.zone.now + 1000.months) }
    end_date { Faker::Time.between(start_date, start_date + 1000.months) }
  end
end
