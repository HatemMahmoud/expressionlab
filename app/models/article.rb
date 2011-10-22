class Article < ActiveRecord::Base
  validates :title, :summary, :content, :presence => true
  
  scope :published, lambda { where('published_at IS NOT NULL') }
end