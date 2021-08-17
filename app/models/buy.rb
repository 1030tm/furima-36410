class Buy < ApplicationRecord
  
  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :consignor_id
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'を入力してください' }
    validates :buy
  end

  validates :building
end
