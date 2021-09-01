FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation {password}
    company_name          {Faker::Company.name}
    profession_id         {Faker::Number.within(range: 2..8)}
    profile               {Faker::Lorem.sentence}
    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end