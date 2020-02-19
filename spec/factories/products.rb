FactoryBot.define do
  factory :product do
    sequence(:name)                   {Faker::Book.title}
    sequence(:price)                  {Faker::Number.within(range: 300..999999)}
    sequence(:detail)            {Faker::Lorem.sentence}
    status                         {1}
    postage                         {1}
    estimated_date                  {1}
    # shipping_area                      {Faker::Number.within(range: 1..48)}
  end
end