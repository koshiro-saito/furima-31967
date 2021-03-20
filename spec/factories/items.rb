FactoryBot.define do
  factory :item do
    association :user
    item_name { '大福' }
    description { 'お茶に合う' }
    category_id { 10 }
    status_id { 2 }
    delivery_fee_id { 3 }
    prefecture_id { 5 }
    time_to_ship_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('/Users/koshiro/projects/furima-31967/app/assets/images/test_image.png'), filename: 'test_image.png')
    end

  end
end