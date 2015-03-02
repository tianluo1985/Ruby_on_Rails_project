class User < ActiveRecord::Base
	@@page_size=10
	def self.total_pages
		(self.count+@@page_size-1)/@@page_size
	end

	def self.get_by_page_num(p_num)
		page_num=p_num
		pages=self.total_pages
		if page_num>pages
			page_num=pages
		elsif page_num<1
			page_num=1
		end
		self.limit(@@page_size).offset((page_num-1)*@@page_size)
	end
	def self.authenticate(args={})
		if args.size !=2
			raise 'wrong arguments numbers, expected 2'
		end
		self.where(username: args[:username],password: args[:password])[0]	
	end
end
