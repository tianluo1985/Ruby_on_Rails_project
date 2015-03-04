class Product < ActiveRecord::Base
	belongs_to :category
	validates :name, :price,:category_id ,presence: true
end
