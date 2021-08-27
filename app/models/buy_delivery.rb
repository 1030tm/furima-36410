class BuyDelivery
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id,
                :postal_code, :consignor_id, :city, :address, :building, :tel, :buy_id

  with_options presence: true do
    validates :user_id
    validates :item_id

    # --- 配送先の情報 ---
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'を入力してください' }
    validates :consignor_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/, message: 'を入力してください' }, length: { maximum: 11 }
    
  end
  validate :buy_id
  validate :building

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, consignor_id: consignor_id, city: city, address: address, building: building, tel: tel, buy_id: buy.id)
  end
end