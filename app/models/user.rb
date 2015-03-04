class User < ActiveRecord::Base
	validates :username, :password, presence: true
	validates :username, uniqueness: true

	# check whether the inputed username and password matchs record in 
	#database
	def self.authenticate(args={})
		if args.size !=2
			raise 'wrong arguments numbers, expected 2'
		end
		self.where(args)[0]	
	end
end
