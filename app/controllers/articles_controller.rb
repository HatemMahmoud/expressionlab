class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    title = params[:title].gsub('_', '.').titleize
    @article = Article.where(:title => title, :published_at => date...date+1.day).first
    @comment = Comment.new
  end
end