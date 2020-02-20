class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|     # 全消しからmigrateする場合、categoryとuserテーブルを先に導入する
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.references :category, null: false, foreign_key: true
      t.string :brand
      t.string :size
      t.integer :price, null: false
      t.integer :status, null: false
      t.integer :shipping_area, null: false
      t.integer :estimated_date, null: false
      t.integer :postage, null: false
      t.integer :favorite, null: false, default: 0
      t.timestamps
      t.integer :buyer_id
    end
  end
end
