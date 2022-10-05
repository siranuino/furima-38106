FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'白井'}
    first_name            {'一輝'}
    family_name_kana      {'シライ'}
    first_name_kana       {'カズキ'}
    birthday              {'1995-05-01'}
  end
end