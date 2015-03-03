class CategoriesController < ApplicationController
	def new
		@pid=params[:pid]
		unless @pid
			redirect_to '/'
			return
		end
	end
	def create
		category=Category.create(name: params[:name],descr: params[:descr],pid: params[:pid])
		if category.valid?
			redirect_to categories_admin_url
		else
			redirect_to categories_new_url(params[:pid])
		end
	end
	def index
		@root_categories=Category.where(pid: 0)
	end
end
