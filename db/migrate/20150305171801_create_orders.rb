class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type
      t.decimal :total_prices, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
