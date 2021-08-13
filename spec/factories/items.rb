FactoryBot.define do
  factory :item do
    item_name                 { 'ボックス' }
    explanation               { '箱です' }
    category_id               { 2 }
    condition_id              { 2 }
    postage_id                { 2 }
    consignor_id              { 2 }
    shipping_day_id           { 2 }
    price                     { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/mask_tedukuri_check.png'), filename: 'test_image.png')
    end
  end
end
