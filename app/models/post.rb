class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true

  #Will_paginate count per page
  def self.per_page
    20
  end
end
