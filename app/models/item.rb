class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation

    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :consignor_id
      validates :shipping_day_id
    end

    validates :price, numericality: [in: 300..9999999 ]
    validates :user
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :consignor
  belongs_to :shipping_day

end
