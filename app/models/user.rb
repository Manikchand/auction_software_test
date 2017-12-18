class User < ApplicationRecord
	has_many :products, :foreign_key => "user_id"
	before_create :set_salt_password

	def set_salt_password
		self.salt_password = Digest::MD5.hexdigest(self.salt_password)
	end
end
