class Comment < ActiveRecord::Base
  belongs_to :article, :counter_cache => true
  
  validates :article_id, :presence => true
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 50, :allow_blank => true}
  validates :email, :presence => true, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :allow_blank => true}
  validates :website, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :allow_blank => true}
  validates :content, :presence => true, :length => {:minimum => 3, :maximum => 2000, :allow_blank => true}
end