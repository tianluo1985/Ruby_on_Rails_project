class Cart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy

	def add_product(product_id,quantity)
		current_item = self.cart_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += quantity.to_i
		else
			current_item=self.cart_items.build(product_id: product_id,quantity: quantity)
		end
		current_item
	end
end
