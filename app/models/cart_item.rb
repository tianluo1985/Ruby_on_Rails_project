class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def price
  	self.quantity*self.product.price
  end
end
