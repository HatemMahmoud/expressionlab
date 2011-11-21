class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    date = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
    @article = Article.find_by_slug_and_published_at(params[:slug], date...date+1.day)
    @comment = Comment.new
  end
end