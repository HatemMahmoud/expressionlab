class CreateActiveAdminComments < ActiveRecord::Migration
  def change
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.references :resource, :polymorphic => true, :null => false
      t.references :author, :polymorphic => true
      t.text :body
      t.timestamps
    end
    add_index :active_admin_comments, [:namespace]
    add_index :active_admin_comments, [:author_type, :author_id]
  end
end
