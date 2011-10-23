class CommentsController < ApplicationController
  def create
    @article = Article.published.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      @article.comments.delete(@comment)
      render 'articles/show'
    end
  end
end
