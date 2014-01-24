class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :posts
  validates :name, presence: true

  #Will_paginate count per page
  def self.per_page
    10
  end
end
