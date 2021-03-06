# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :email_down_case
  before_create :remember_me

  has_many :posts

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: REGEX_EMAIL }
  validates :password, presence: true, length: { in: 6..50 }
  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  private

  def email_down_case
    email.downcase!
  end

  def remember_me
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
end
