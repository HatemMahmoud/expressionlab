class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates :title, :summary, :content, :presence => true
  
  scope :published, lambda { where('published_at IS NOT NULL') }
  
  acts_as_taggable
end