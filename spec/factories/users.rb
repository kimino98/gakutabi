FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test1234'}
    password_confirmation {password}
  end
end