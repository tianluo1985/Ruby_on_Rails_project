class AddImgToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :img_url, :string, default: 'http://www.placehold.it/350x350'
  end
end
