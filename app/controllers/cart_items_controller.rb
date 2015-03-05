class CartItemsController < ApplicationController
	include SessionHandle
	before_action :get_cart

	def add
		@product=Product.find(params[:product_id])
	rescue ActiveRecord::RecordNotFound
		redirect_to root_url, notice: "product not exist"
	end

	def add_to_cart
		product=Product.find(params[:product_id])
		quantity=params[:quantity]
		@cart_item=@cart.add_product(product.id,quantity)
		respond_to do |format|
			if @cart_item.save
				format.html { redirect_to carts_show_url,notice: 'successfully updated'}
				#later add Ajax/js code below
				format.js{}
			else
				format.html {render action: 'add'}
				format.js {}
			end
		end
	end

	def update_item
		cart_item=CartItem.find(params[:cart_item_id])
		quantity=params[:quantity]
		cart_item.quantity=quantity
		respond_to do |format|
			if cart_item.save
				format.html { redirect_to carts_show_url, notice: 'successfully updated'}
				#later add AjaX/js code below
				format.js{}
			else
				format.html { redirect_to root_url, notice: 'update fail'}
				format.js{}
			end
		end
	end

	def delete_item
		cart_item=CartItem.find(params[:cart_item_id])
		cart_item.destroy
		respond_to do |format|
			format.html { redirect_to carts_show_url, notice: 'item deleted'}
			format.js{}
		end
	end
end
