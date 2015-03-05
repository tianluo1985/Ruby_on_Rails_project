class HomeController < ApplicationController
	include PagingHandle
	include SearchHandle

	def index
		page_size=5
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

	def basicsearch
		keyword=params[:keyword]
		if keyword.empty?
			redirect_to root_url, notice: 'no product found matching your search'
			return
		end
		@products=search_by_keyword(:Product,name: keyword)
	end

	def advancedsearch
		@categories=Category.where.not(pid: 0)
	end

	def searchresult
		keyword=params[:keyword]
		category_id=params[:category_id]

		price_from=params[:price_from]
		price_to=params[:price_to]
		#should check whether input is valid here
	
		res=Product.where(price: price_from .. price_to)
		unless category_id=="all"
			res=res.where(category_id: category_id)
		end
		res= res.where('name like ?',"%#{keyword}%")
		if res.empty?
			redirect_to root_url, notice: "products not found"
			return
		end
		@products=res
	end
end
