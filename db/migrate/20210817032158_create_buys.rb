class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end

    create_table :deliveries do |t|
      t.string :postal_code, null: false
      t.integer :consignor_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :tel, null: false
      t.references :buy, null: false, foreign_key: true
    end
  end
end
