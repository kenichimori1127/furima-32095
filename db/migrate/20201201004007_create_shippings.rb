class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string  :postcode,     null: false, foreign_key: true
      t.integer :area_id,      null: false, foreign_key: true
      t.string  :city,         null: false, foreign_key: true
      t.string  :block,        null: false, foreign_key: true
      t.string  :building,     null: false, foreign_key: true
      t.string  :phone_number, null: false, foreign_key: true
      t.integer :order_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
