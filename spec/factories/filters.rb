FactoryGirl.define do
  factory :filter do
    user
    town
    name { Faker::Lorem.word }
  end
end
