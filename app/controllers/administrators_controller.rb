class AdministratorsController < ApplicationController

	def new
		@administrator=Administrator.new
	end

	def create
		@administrator=Administrator.new(administrator_params)
		if @administrator.save
			redirect_to root_url, notice: "Administrator Created Successfully"
		else
			render action: 'new'
		end
	end

	def login
	end

	def authenticate
		administrator=Administrator.find_by(username:params[:username])
		if administrator and administrator.authenticate(params[:password])
			session[:administrator_id]=administrator.id
			redirect_to root_url, notice: "Administrator Login Successfully"
		else
			redirect_to administrators_login_url, notice: "Invalid Username or Password"
		end
	end

	def logout
		if session[:administrator_id]
			session[:administrator_id]=nil
		end
		redirect_to root_url
	end
	
private

	def administrator_params
		params.require(:administrator).permit(:username,:password)
	end
end
