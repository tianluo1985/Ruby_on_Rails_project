module ApplicationHelper

	def user_loggedin?
		User.find(session[:user_id])
	rescue ActiveRecord::RecordNotFound
		false
	end

	def administrator_loggedin?
		Administrator.find(session[:administrator_id])
	rescue ActiveRecord::RecordNotFound
		false
	end
end
