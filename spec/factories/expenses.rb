FactoryBot.define do
  factory :expense do
    category { Faker::Hobby.activity }
    value { Faker::Number.within(range: 100.0..500.0) }
  end
end
