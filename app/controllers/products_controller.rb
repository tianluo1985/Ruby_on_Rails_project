class ProductsController < ApplicationController
	include PagingHandle

	def new
		@category_id=params[:category_id]
		@categories=Category.where.not(pid: 0)
	end

	def create
		cate=Category.find(params[:category_id])
		res=cate.add(name: params[:name],price: params[:price],descr: params[:descr],img_url: [:img_url])
		if res
			redirect_to categories_admin_url ,notice: 'successfully added a product'
		else
			redirect_to products_new_url(category_id: cate.id), notice: 'add product fails'
		end
	end
	def index
		page_size=10
		category_id=params[:category_id]
		@page=params[:page]
		if category_id
			products=Category.find(category_id).products
		else
			products=Product.all
		end
		unless @page
			@page=1
		else
			@page=@page.to_i
		end
		total_numbers=products.count
		@total_pages=total_pages(total_numbers,page_size)
		@products=items_by_page_number(products,@page,page_size)
	end
end
