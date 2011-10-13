class Article < ActiveRecord::Base
  validates :title, :summary, :content, :published_at, :presence => true
end
