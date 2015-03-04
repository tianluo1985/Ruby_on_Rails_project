module ProductsHelper
	def selected(a,b)
		if a.to_s==b.to_s
			return ' selected'
		else
			return ''
		end
	end
end
