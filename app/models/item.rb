class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation

    with_options numericality: { other_than: 1, message: "を選択してください" } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :consignor_id
      validates :shipping_day_id
    end

    validates :price, inclusion: { in: 300..9_999_999 }
    validates :price_before_type_cast, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' }
    validates :user
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :consignor
  belongs_to :shipping_day
end
