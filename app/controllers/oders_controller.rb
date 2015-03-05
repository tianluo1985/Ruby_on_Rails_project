class OdersController < ApplicationController
	include SessionHandle
	before_action :get_cart

end
