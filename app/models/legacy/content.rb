class Legacy::Content < ActiveRecord::Base
  establish_connection 'legacy'
  
  scope :articles, where("type='article' AND excerpt<>''").order('published_at ASC')
  scope :comments, where(:type => 'Comment').order('created_at ASC')
  scope :approved, where(:approved => 1)
end