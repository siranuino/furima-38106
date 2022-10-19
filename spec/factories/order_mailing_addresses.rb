FactoryBot.define do
  factory :order_mailing_address do
    post_code        {'123-1234'}
    area_id          {Faker::Number.between(from: 2, to: 48)}
    municipality     {'名古屋'}
    address          {'1-1'}
    building_name    {''}
    phone_number     {Faker::Number.between(from: 10000000000, to: 99999999999)}
    token            {"a1111a11"}
  end
end
