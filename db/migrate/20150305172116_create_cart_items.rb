class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.references :product, index: true
      t.belongs_to :cart, index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :cart_items, :products
    add_foreign_key :cart_items, :carts
    add_foreign_key :cart_items, :orders
  end
end
