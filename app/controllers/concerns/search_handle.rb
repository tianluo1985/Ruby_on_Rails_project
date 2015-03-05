module SearchHandle
	extend ActiveSupport::Concern

	def search_by_keyword(item,column_keyword)
		item_class=Object.const_get(item)
		item=item.to_s
		items=item.downcase+'s'
		column=column_keyword.keys[0]
		keyword=column_keyword[column]
		column=column.to_s
		keyword=keyword.to_s
		#be careful with the risk of SQL injection, later should be replaced by bettere ways
		sql_sentence='select * from '+items+' where '+column+' like "%'+keyword+'%"'
		item_class.find_by_sql sql_sentence
	end

	def product_search(items,column_keyword)
		column=column_keyword.keys[0]
		keyword=column_keyword[column]
		column=column.to_s
		keyword=keyword.to_s
		sql_sentence='select * from products where '+column+' like "%'+keyword+'%"'
		items.find_by_sql sql_sentence
	end
end