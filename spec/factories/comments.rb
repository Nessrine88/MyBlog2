FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    association :user, factory: :user
    association :post, factory: :post
  end
end
