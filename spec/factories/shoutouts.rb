FactoryGirl.define do
  factory :shoutout do
    content Faker::Lorem.words(10).join(" ")
  end
end