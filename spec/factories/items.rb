FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    info { Faker::Lorem.sentence }
    association :user
    category_id { 2 }
    sales_status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    schedule_delivery_id { 2 }
    price { 4000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
