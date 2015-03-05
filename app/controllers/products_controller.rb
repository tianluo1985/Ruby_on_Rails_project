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
			redirect_to categories_admin_url ,notice: 'successfully added a new product'
		else
			redirect_to products_new_url(category_id: cate.id), notice: 'add product fails'
		end
	end

	def delete
		product=Product.find(params[:id])
		product.destroy
		redirect_to products_admin_url, notice: 'product successfully deleted'
	end

	def modify
		@id=params[:id]
		@product=Product.find(@id)
	end

	def change
		product=Product.find(params[:id])
		product.name=params[:name]
		product.price=params[:price]
		product.img_url=params[:img_url]
		product.descr=params[:descr]
		if product.save
			redirect_to products_admin_url, notice: "successfully updated product"
		else
			redirect_to products_modify(params[:id]), notice: "update fails"
		end
	end

	def index
		page_size=10
		@category_id=params[:category_id]||"all"
		@page=params[:page]
		if @category_id == "all"
			products=Product.all
		else
			products=Category.find(@category_id).products
		end
		unless @page
			@page=1
		else
			@page=@page.to_i
		end
		total_numbers=products.count
		@total_pages=total_pages(total_numbers,page_size)
		@page=boundary_check(@page,@total_pages)
		@products=items_by_page_number(products,@page,page_size)
		@root_categories=Category.where(pid: 0)
	end

end
