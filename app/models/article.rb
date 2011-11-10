class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates :title, :presence => true, :length => {:minimum => 3, :maximum => 255, :allow_blank => true}
  validates :summary, :content, :presence => true, :length => {:minimum => 3, :maximum => 65535, :allow_blank => true}
  
  scope :published, where('published_at IS NOT NULL').order('published_at DESC')
  
  acts_as_taggable
end