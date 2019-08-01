class User < ApplicationRecord
	attr_accessor :remember_token
	before_save :email_down_case
	before_create :remember_token

  validates :name,presence: true,uniqueness: true, length: {minimum: 2}
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: REGEX_EMAIL }
	validates :password, presence: true, length: {in: 6..50}
	has_secure_password

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(token)
		Digest::SHA1.hexdigest(token)
	end

	private

	def email_down_case
		self.email.downcase!
	end

	def remember_token
		self.remember_token = User.new_token
		self.remember_digest = User.digest(remember_token)
	end
end
