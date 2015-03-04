class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :descr
      t.decimal :price
      t.belongs_to :category ,index: true
      
      t.timestamps null: false
    end
  end
end
