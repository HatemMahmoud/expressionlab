class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id].gsub('_', '.').titleize).name
    @articles = Article.published.tagged_with(@tag)
  end
end