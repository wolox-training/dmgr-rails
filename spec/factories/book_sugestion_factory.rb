# frozen_string_literal: true

FactoryBot.define do
  factory :book_sugestion do
    editorial { Faker::HitchhikersGuideToTheGalaxy.location }
    price { Faker::Number.decimal(2) }
    author { Faker::Name.name }
    title { Faker::LordOfTheRings.location }
    link { Faker::Internet.url }
    publisher { Faker::Name.name }
    year { Faker::Number.number(4) }
  end
end
