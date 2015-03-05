class ChangeColumn < ActiveRecord::Migration
  def up
  	change_table :products do |t|
  		t.change :price, :decimal, precision: 10, scale: 2
  	end
  end
  def down
  	change_table :products do |t|
  		t.change :price, :decimal
  	end
  end
end
