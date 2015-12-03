
class User < ActiveRecord::Base
	include BCrypt 

	validates :name, presence: true
	validates :email, presence: true
	validates :password_h, presence: true

	has_many :spaces_users
	has_many :spaces, through: :spaces_users


	def password
		@password ||= Password.new(password_h) unless password_h.nil? 
	end

	def password=(new_password)
		return nil if new_password.nil? || new_password.length == 0
		@password = Password.create(new_password)
		self.password_h = @password
	end

end
