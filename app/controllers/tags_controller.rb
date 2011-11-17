class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id].gsub('_', '.').titleize) || params[:id]
    @articles = Article.published.tagged_with(@tag)
  end
end