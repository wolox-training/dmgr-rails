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

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 123123 }
    password_confirmation { 123123 }
    email { Faker::Internet.email}
  end
end
