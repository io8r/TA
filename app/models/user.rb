class User < ApplicationRecord
	before_save { name.downcase! }
	validates :name, presence: true, 
									 length: { maximum: 15 }, 
									 uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 3}

end
