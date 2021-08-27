FactoryBot.define do
  factory :buy_delivery do
    postal_code         { '123-4567' }
    consignor_id        { 2 }
    city                { '市区町村' }
    address             { '番地' }
    building            { '建物' }
    tel                 { '09012345678' }
  end
end
