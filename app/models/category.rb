class Category < ActiveRecord::Base
	validates :name,:pid, presence: true
	has_many :products

	def add(parameters)
		product=self.products.build(parameters)
		product.save
	end
end
