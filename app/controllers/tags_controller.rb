class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id])
    @articles = Article.published.tagged_with(@tag.name)
  end
end