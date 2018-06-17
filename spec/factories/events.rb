FactoryGirl.define do
  factory :event do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    town
    starts_at { Time.current }
    ends_at { 1.day.since }
  end
end
