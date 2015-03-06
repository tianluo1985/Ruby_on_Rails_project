class OrdersController < ApplicationController
	include SessionHandle
	include PagingHandle
	before_action :get_cart
	before_action :administrator_login_check, only: [:index,:show,:delete]

	def new
		@order=Order.new
		if session[:user_id]
			user=User.find(session[:user_id])
			# I suddenly realized that My user model only have username not real name 
			@order.name=user.username
			@order.address=user.addr
			@order.email=user.email
		end
	end

	def create
		@order=Order.new(order_params)
		@order.total_prices=@cart.total_prices
		@order.get_cart_items_from_cart(@cart)
		
		if @order.save
			Cart.destroy(session[:cart_id])
			session[:cart_id]=nil
			redirect_to root_url, notice: 'thanks for shopping with us'
		else
			render action: 'new'
		end
	end

	def index
		page_size=10
		@page=params[:page]
		unless @page
			@page=1
		else
			@page=@page.to_i
		end
		orders=Order.all
		total_numbers=orders.count
		@total_pages=total_pages(total_numbers,page_size)
		@page=boundary_check(@page,@total_pages)
		@orders=items_by_page_number(orders,@page,page_size)
	end

	def show
		@id=params[:id]
		@order=Order.find(@id)
	rescue ActiveRecord::RecordNotFound
		redirect_to root_url, notice: 'order not exist'
	end

	def delete
		order=Order.find(params[:id])
		order.destroy
		redirect_to orders_admin_url , notice: 'order successfully deleted'
	end

	private
	def order_params
		params.require(:order).permit(:name,:address,:email,:pay_type)
	end
end
