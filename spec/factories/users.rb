FactoryBot.define do
  factory :user do
    email FFaker::Internet.email
    pswrd = FFaker::Lorem.words(4).join("")
    password pswrd
    password_confirmation pswrd
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
  end
end