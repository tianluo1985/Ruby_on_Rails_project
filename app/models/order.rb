class Order < ActiveRecord::Base
	PAYMENT_TYPES =["Visa","Master Card","Discover","American Express","JCB","UnionPay"]
	has_many :cart_items, dependent: :destroy
	validates :name, :address, :email, :total_prices, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	def get_cart_items_from_cart(cart)
		cart.cart_items.each do |item|
			item.cart_id=nil
			self.cart_items << item
		end
	end
end
