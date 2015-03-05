class CartsController < ApplicationController
	include SessionHandle
	before_action :get_cart

	def show
		@cart_items=@cart.cart_items
	end

	def empty_cart
		@cart.destroy if @cart.id == session[:cart_id]
		session[:cart_id]=nil
		redirect_to root_url, notice: 'cart successfully emptied'
	end
end
