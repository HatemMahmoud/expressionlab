class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article
      t.string :name
      t.string :email
      t.string :website
      t.text :content
      t.timestamps
    end
    add_index :comments, :article_id
    change_table :articles do |t|
      t.integer :comments_count, :default => 0, :null => false
    end
  end
end
