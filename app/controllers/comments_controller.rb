class CommentsController < ApplicationController
  def create
    @article = Article.published.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      redirect_to "#{view_context.article_path_by_date(@article)}#comment-#{@comment.id}"
    else
      @article.comments.delete(@comment)
      render 'articles/show'
    end
  end
end