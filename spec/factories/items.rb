FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    category { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
    image_url { Faker::Internet.url }
  end
end
