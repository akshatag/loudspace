class Space < ActiveRecord::Base
	validates :name, presence: true

	has_many :spaces_users
	has_many :users, through: :spaces_users
	has_many :media
end
