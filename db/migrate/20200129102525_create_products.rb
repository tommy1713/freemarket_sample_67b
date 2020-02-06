class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :user
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :category, null: false
      t.string :brand
      t.string :size
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :shipping_area, null: false
      t.integer :estimated_date, null: false
      t.integer :postage, null: false
      t.integer :situation, null: false
      t.integer :favorite, null: false
      t.timestamps
      t.references :image, null: false
      t.integer :stock, null: false
    end
  end
end
