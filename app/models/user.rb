class User < ActiveRecord::Base
  #Avoid duplicates in DB
  before_save { self.email = email.downcase }

  #Enforcing valid username/email address
  validates :name, presence: true, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 8 }

  has_secure_password
end
