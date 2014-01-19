class Medium < ActiveRecord::Base
  validates :image, presence: true
  validates :name, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
