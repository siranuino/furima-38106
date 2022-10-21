FactoryBot.define do
  factory :item do
    image              {'test.jpeg'}
    title              {'商品名'}
    explanation        {'商品説明'}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)}
    defrayment_id      {Faker::Number.between(from: 2, to: 3)}
    area_id            {Faker::Number.between(from: 2, to: 48)}
    deliverytime_id    {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
