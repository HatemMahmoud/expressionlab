namespace :legacy do
  namespace :migrate do
    desc 'Migrate everything'
    task :all => ['legacy:migrate:articles', 'legacy:migrate:tags', 'legacy:migrate:comments']
  
    desc 'Migrate articles'
    task :articles => :environment do
      puts 'Migrating articles...'
      legacy_articles = Legacy::Content.articles
      for legacy_article in legacy_articles do
        puts "Migrating article #{legacy_article.id}..."
        article = Article.new(:legacy_id => legacy_article.id, :title => legacy_article.title, :summary => legacy_article.excerpt, :content => legacy_article.body, :created_at => legacy_article.created_at, :published_at => legacy_article.published_at)
        unify_image_urls(article.summary)
        unify_image_urls(article.content)
        unless article.save
          puts legacy_article.inspect
          puts article.errors.messages
        end
      end
      puts "#{legacy_articles.size} Articles migrated successfully."
    end
    
    def unify_image_urls(string)
      string.gsub!('/images/mephisto/logo.png', '/assets/articles/mephisto.png')
      string.gsub!('/assets/2011/4/1/msvcrt-ruby18.dll-error.png', '/assets/articles/msvcrt-ruby18-dll-error.png')
      # replace /assets/yyyy/m/d/ in image URLs with /assets/articles/
      string.gsub!(/\d{4}\/\d{1,2}\/\d{1,2}\/[\w-]*\.(?:jpg|gif|png)/) do |match|
        "articles/#{match}".gsub!(/\d{4}\/\d{1,2}\/\d{1,2}\//, '')
      end
    end
    
    desc 'Migrate tags'
    task :tags => :environment do
      puts 'Migrating tags...'
      for article in Article.all do
        puts "Migrating tags of article #{article.id}..."
        taggings = Legacy::Tagging.find_all_by_taggable_id(article.legacy_id)
        tags = taggings.map{|tagging| Legacy::Tag.find(tagging.tag_id)}
        article.tag_list = tags.map{|tag| tag.name.parameterize}
        article.save!
      end
      puts 'Tags migrated successfully.'
    end
    
    desc 'Migrate comments'
    task :comments => :environment do
      puts 'Migrating comments...'
      legacy_comments = Legacy::Content.comments.approved
      for legacy_comment in legacy_comments do
        puts "Migrating comment #{legacy_comment.id}..."
        comment = Article.find_by_legacy_id(legacy_comment.article_id).comments.build(:name => legacy_comment.author, :email => legacy_comment.author_email, :website => legacy_comment.author_url, :content => legacy_comment.body, :created_at => legacy_comment.created_at)
        unless comment.save
          puts legacy_comment.inspect
          puts comment.errors.messages
        end
      end
      puts "#{legacy_comments.size} Comments migrated successfully."
    end
  end
end