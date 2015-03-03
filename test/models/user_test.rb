require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "users validations" do
  	tim=users(:TT)
  	#assert_equal tim.username, 'Tim0312'
  	#assert_equal tim.password, '654321'
  	#assert tim.valid?
  	#user=User.new(username: tim.username,password: tim.password,phone: tim.phone,addr: tim.addr,email: tim.email)
  	user=User.create(username: tim.username, password: tim.password,email: tim.email)
  	assert user.valid?
  end
end
