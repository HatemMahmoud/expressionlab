namespace :legacy do
  desc 'Migrate articles'
  task(:migrate_articles => :environment) do
    puts 'Migrating articles...'
    legacy_articles = Legacy::Content.articles
    for legacy_article in legacy_articles do
      puts "Migrating #{legacy_article.id}..."
      article = Article.new(:legacy_id => legacy_article.id, :title => legacy_article.title, :summary => legacy_article.excerpt, :content => legacy_article.body, :created_at => legacy_article.created_at, :published_at => legacy_article.published_at)
      unless article.save
        puts legacy_article.inspect
        puts article.errors.messages
      end
    end
    puts "#{legacy_articles.size} Articles migrated successfully."
  end
  
  desc 'Migrate comments'
  task(:migrate_comments => :environment) do
    puts 'Migrating comments...'
    legacy_comments = Legacy::Content.comments.approved
    for legacy_comment in legacy_comments do
      puts "Migrating #{legacy_comment.id}..."
      comment = Article.find_by_legacy_id(legacy_comment.article_id).comments.build(:name => legacy_comment.author, :email => legacy_comment.author_email, :website => legacy_comment.author_url, :content => legacy_comment.body, :created_at => legacy_comment.created_at)
      unless comment.save
        puts legacy_comment.inspect
        puts comment.errors.messages
      end
    end
    puts "#{legacy_comments.size} Comments migrated successfully."
  end
end