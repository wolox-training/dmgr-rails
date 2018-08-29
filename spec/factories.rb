# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    genre { Faker::HitchhikersGuideToTheGalaxy.location }
    author { Faker::Name.name }
    image { Faker::Internet.url }
    title { Faker::LordOfTheRings.location }
    publisher { Faker::Name.name }
    year { Faker::Number.number(4) }
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 123_123 }
    password_confirmation { 123_123 }
    email { Faker::Internet.email }
  end

  factory :rent do
    user_id { Faker::Number.number(1000) }
    book_id { Faker::Number.number(1000) }
    start_date { Faker::Time.between(Time.now.utc - 1000.months, Time.now.utc + 1000.months) }
    end_date { Faker::Time.between(Time.now.utc - 1000.months, Time.now.utc + 1000.months) }
  end
end
