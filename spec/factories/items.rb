FactoryBot.define do
  factory :item do
    text { Faker::Lorem.characters(number: 5) }
  end
end