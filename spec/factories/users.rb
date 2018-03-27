FactoryBot.define do
  factory :user do
    name "TikiTango"
    email { Faker::Internet.email }
    password "123qwe"
    password_confirmation "123qwe"
  end
end
