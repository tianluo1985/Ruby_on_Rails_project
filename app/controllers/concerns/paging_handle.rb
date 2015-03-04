module PagingHandle
	extend ActiveSupport::Concern

	private

	def total_pages(item_numbers,page_size)
		(item_numbers+page_size-1)/page_size
	end

	def items_by_page_number(items,page_number,page_size)
		items.limit(page_size).offset((page_number-1)*page_size)
	end

	def boundary_check(page_number,total_pages)
		page_number=[page_number,total_pages].min 
		page_number=[page_number,1].max 
	end

end