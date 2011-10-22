class ArticlesController < ApplicationController
  def index
    @articles = Article.published
  end

  def show
    @article = Article.published.find(params[:id])
  end
end