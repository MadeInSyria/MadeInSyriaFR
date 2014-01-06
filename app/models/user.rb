class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  #Avoid duplicates in DB
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  #Enforcing valid username/email address
  validates :name, presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 8 }

  #Will_paginate count per page
  def self.per_page
    10
  end

  #Session token generation
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

  has_secure_password
end
