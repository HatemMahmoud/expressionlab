ActiveAdmin.register Comment, :as => 'ArticleComment' do
  index do
    column 'ID', :id, :sortable => :id do |comment|
      link_to comment.id, admin_article_comment_path(comment)
    end
    column :article, :sortable => :article do |comment|
      link_to comment.article.title, comment.article
    end
    column :name
    column :email
    column :website
    column :content
    column :created_at
    column :Delete do |comment|
      link_to 'Delete', admin_article_comment_path(comment), :method => :delete
    end
  end
end