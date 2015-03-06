class UsersController < ApplicationController
	include PagingHandle
	include SessionHandle
	before_action :administrator_login_check, only: [:delete,:index,:modify]

	def test
		#user=User.authenticate(username:'UserG',password:'123456')
		#session[:user_id]=user.id	
		#@user_id=session[:user_id]
	end
	def test2
		#session[:user_id]=nil
		#@user_id=session[:user_id]
	end
	def new
	end

	def create
		#begin
		#	user=User.create!(username: params[:username],password: params[:password],phone: params[:phone],email: params[:email],addr: params[:addr])
		#rescue
		#	redirect_to '/users/new'
		#	return
		#end
		#redirect_to '/'
		user=User.create(username: params[:username],password: params[:password],phone: params[:phone],email: params[:email],addr: params[:addr])
		if user.valid?
			redirect_to root_url
		else
			redirect_to users_new_url , notice: 'user create fail'
		end
	end

	def delete
		user=User.find(params[:id])
		user.destroy
		redirect_to users_admin_url , notice: 'user successfully deleted'
	end

	def index
		page_size=10
		@page=params[:page]
		unless @page
			@page=1
		else
			@page=@page.to_i
		end
		users=User.all
		total_numbers=users.count
		@total_pages=total_pages(total_numbers,page_size)
		@page=boundary_check(@page,@total_pages)
		@users=items_by_page_number(users,@page,page_size)
	end
	
	def show
		@id=params[:id]
		@user=User.find(@id)
	rescue ActiveRecord::RecordNotFound
		redirect_to root_url, notice: 'user not exist'
	end

	def modify
		@id=params[:id]
		@user=User.find(@id)
	end

	def change
		@id=params[:id]
		user=User.find(@id.to_i)
		user.username=params[:username]
		user.password=params[:password]
		user.email=params[:email]
		user.phone=params[:phone]
		user.addr=params[:addr]
		if user.save
			redirect_to users_admin_url
		else
			redirect_to users_modify_url(@id)
		end
	end

	def login
		@username=cookies[:username]||''
	end

	def logout
		if session[:user_id]
			session[:user_id]=nil
		end
		redirect_to root_url
	end

	def authenticate	
		user=User.authenticate(username: params[:username],password: params[:password])
		if user
			session[:user_id]=user.id
			if params[:rem_uname]
				cookies[:username]=user.username
			else
				cookies.delete(:username)
			end
			redirect_to root_url
		else
			redirect_to users_login_url ,notice: 'username or password not right'
		end
	end
end
