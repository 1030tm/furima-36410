class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :consignor_id
    validates :shipping_day_id
    validates :price
    validates :user
  end

end
