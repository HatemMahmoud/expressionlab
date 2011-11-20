module ArticlesHelper
  def article_path_by_date(article)
    "/#{article.published_at.year}/#{article.published_at.month}/#{article.published_at.day}/#{article.title.gsub('.', '_').parameterize}"
  end
end