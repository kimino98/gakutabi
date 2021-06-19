FactoryBot.define do
  factory :user do
    nickname              {Faker::Name(max_length:9)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
    profession_id         { 2 }
  end
end