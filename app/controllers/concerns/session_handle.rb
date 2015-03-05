module SessionHandle
	extend ActiveSupport::Concern

	private

	def get_cart
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart=Cart.create
		session[:cart_id]=@cart.id
	end

	def user_login_check
		unless User.find_by(id: session[:user_id])
			redirect_to users_login_url, notice: "please login first"
		end
	end

	def administrator_login_check
		unless Administrator.find_by(id: session[:administrator_id])
			redirect_to administrators_login_url, notice: "please login as an Administrator"
		end
	end
end