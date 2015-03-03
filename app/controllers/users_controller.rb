class UsersController < ApplicationController
	def test
		
		#user=User.authenticate(username:'UserG',password:'123456')
		#session[:user_id]=user.id	
		#@user_id=session[:user_id]
	end
	def test2
		session[:user_id]=nil
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
			redirect_to '/'
		else
			redirect_to users_new_path
		end
	end

	def index
		@total_pages=User.total_pages
		if params[:page_num]
			@page_num=params[:page_num].to_i
		else
			@page_num=1
		end
		@users=User.get_by_page_num(@page_num)
	end
	def show
		@page_num=params[:page_num]
		@id=params[:id]
		@user=User.find(@id.to_i)
	end
	def modify
		@id=params[:id]
		@user=User.find(@id.to_i)
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
			redirect_to '/users'
		else
			redirect_to users_modify_path(@id)
		end
	end
	def login
		@msg=params[:msg]||''
		@username=cookies[:username]||''
	end
	def logout
		if session[:user_id]
			session[:user_id]=nil
		end
		redirect_to '/'
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
			redirect_to '/'
		else
			redirect_to users_login_path(msg: 'login fails')
		end
	end
end
