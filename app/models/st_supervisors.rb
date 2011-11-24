class StSupervisors < ActiveRecord::Base
	validates_presence_of :user_name, :password, :first_name,
	:last_name, :age, :email, :country
	validates_uniqueness_of :user_name
	validates_numericality_of :age
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-
	z0-9]+\.)+[a-z]{2,})\Z/i
	
def self.login(name,password)
find(:first,:conditions => ["user_name = ? and password =
?",name, password])
end

end
