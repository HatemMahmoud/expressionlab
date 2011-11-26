class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :prepare_recent_articles
  
  def prepare_recent_articles
    @recent_articles = Article.recent
  end
end