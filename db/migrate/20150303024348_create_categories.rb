class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :descr
      t.integer :pid

      t.timestamps null: false
    end
  end
end
