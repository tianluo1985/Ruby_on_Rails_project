class Category < ActiveRecord::Base
	validates :name,:pid, presence: true
end
