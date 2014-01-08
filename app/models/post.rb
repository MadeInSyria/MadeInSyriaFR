class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true

  #Picture management
  has_attached_file :illustration, :styles => { :medium => "600x250>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.jpeg"

  #Will_paginate count per page
  def self.per_page
    20
  end
end
