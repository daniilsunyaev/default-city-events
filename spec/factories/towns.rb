FactoryGirl.define do
  factory :town do
    name { Faker::Address.city }
  end
end
