FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password { Faker::Alphanumeric.alpha(number: 6) }
  end
end
