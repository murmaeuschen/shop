class User < ActiveRecord::Base
  
  attr_accessible :login_name, :first_name, :lastName, :password, :confirmPassword, :email, :region, :role
  default_scope -> { order("id asc") }
  #paginates_per 3
  

end
