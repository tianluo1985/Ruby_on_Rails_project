class Product < ActiveRecord::Base
	belongs_to :category
	has_many :cart_items
	validates :name, :price,:category_id ,presence: true

	before_destroy :ensure_not_referenced_by_any_cart_item

	private

	def ensure_not_referenced_by_any_cart_item
		self.cart_items.empty?
	end
end
