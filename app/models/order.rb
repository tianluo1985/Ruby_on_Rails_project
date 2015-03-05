class Order < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy

	def get_cart_items_from_cart(cart)
		cart.cart_items.each do |item|
			item.cart_id=nil
			self.cart_items << item
		end
	end
end
