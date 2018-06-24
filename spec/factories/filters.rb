FactoryGirl.define do
  factory :filter do
    town
    name { Faker::Lorem.word }
  end
end
