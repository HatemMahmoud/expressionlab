ActiveAdmin.register Article do
  index do
    column 'ID', :id
    column :title, :sortable => :title do |article|
      link_to article.title, article
    end
    column :created_at
    column :updated_at
    column :published_at
    column :comments_count
    column :Edit do |article|
      link_to 'Edit', edit_admin_article_path(article)
    end
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :summary
      f.input :content
      f.input :tag_list, :label => 'Tags'
      f.input :published_at
    end
    f.buttons
  end
end