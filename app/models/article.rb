class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates :title, :slug, :presence => true, :length => {:minimum => 3, :maximum => 255, :allow_blank => true}
  validates :summary, :content, :presence => true, :length => {:minimum => 3, :maximum => 65535, :allow_blank => true}
  
  scope :published, where('published_at IS NOT NULL').order('published_at DESC')
  scope :recent, published.order('published_at DESC').limit(5)
  
  acts_as_taggable

  before_save :update_slug
  
  def update_slug
    self.slug = self.title.parameterize
  end
end