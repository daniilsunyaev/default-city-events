FactoryGirl.define do
  factory :comment do
    user
    text { Faker::Lorem.paragraph }
  end
end
