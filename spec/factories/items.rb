FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.sentence}
    image                {Faker::Lorem.sentence}
    description          {Faker::Lorem.sentence}
    category_id          {rand(2..11)}
    condition_id         {rand(2..7)}
    deliver_fee_cover_id {rand(2..3)}
    prefecture_id        {rand(1..47)}
    deliver_date_id      {rand(2..4)}
    price                {rand(300..9999999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end   