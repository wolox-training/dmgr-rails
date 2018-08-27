# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    genre { Faker::HitchhikersGuideToTheGalaxy.location }
    author { Faker::Name.name }
    image { Faker::String.random }
    title { Faker::LordOfTheRings.location }
    publisher { Faker::Name.name }
    year { Faker::Number.number(4) }
  end
end
