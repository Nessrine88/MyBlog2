FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    association :author, factory: :user
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
