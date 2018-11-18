FactoryBot.define do
  factory :shoutout do
    content FFaker::Lorem.words(10).join(" ")
  end
end
