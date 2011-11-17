class TagsController < ApplicationController
  def show
    @tag = params[:id].gsub('_', '.').titleize
    @articles = Article.published.tagged_with(@tag)
  end
end