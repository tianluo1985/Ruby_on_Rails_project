class User < ActiveRecord::Base
	validates :username, :password, presence: true
	validates :username, uniqueness: true
	after_create :user_created
	#later I realized this could be done by simply caching the html pages
	#so In later modules I use that way
	@@page_size=10
	@@total_pages=nil
	@@total_users=nil

	#call backs to update the total user number and page number after
	#new user created 
	def user_created
		@@total_users=User.total_users+1
		@@total_pages=(@@total_users+@@page_size-1)/@@page_size
	end

	def self.total_users
		if @@total_users
			return @@total_users
		else
			@@total_users= self.count
		end
	end

	def self.total_pages
		if @@total_pages
			return @@total_pages
		else
			@@total_pages=(self.total_users+@@page_size-1)/@@page_size
		end
	end

	#retrive the list of users on page p_num
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

	# check whether the inputed username and password matchs record in 
	#database
	def self.authenticate(args={})
		if args.size !=2
			raise 'wrong arguments numbers, expected 2'
		end
		self.where(username: args[:username],password: args[:password])[0]	
	end
end
