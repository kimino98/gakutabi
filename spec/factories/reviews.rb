FactoryBot.define do
  factory :review do
    faclity_name     {Faker::Company.name}
    hotel_type_id    {Faker::Number.within(range: 2..13)}
    grade_id         {Faker::Number.within(range: 2..20)}
    region_id        {Faker::Number.within(range: 2..47)}
    student_count_id {Faker::Number.within(range: 2..12)}
    season_id        {Faker::Number.within(range: 2..5)}
    price            {Faker::Number.number(digits: 4)}
    text             {Faker::Lorem.sentence}
    safety           {Faker::Lorem.sentence}
    association :user

    after(:build) do |review|
      review.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
