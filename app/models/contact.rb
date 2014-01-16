class Contact
  include ActiveModel::Model

  attr_accessor :name, :subject, :email, :message

  validates :name, presence: true
  validates :email, presence: true
  validates :subject, presence: true
  validates :message, presence: true, length: { maximum: 1000 }
end