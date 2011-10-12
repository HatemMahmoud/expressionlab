class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.text :content

      t.timestamps
    end
  end
end
