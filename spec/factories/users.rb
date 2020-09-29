FactoryBot.define do
  factory :user do
    email { "user@mail.com" }
    password { "password" }
    subscriber { false }
  end
end
