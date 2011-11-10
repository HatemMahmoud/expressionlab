class AddLegacyIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :legacy_id, :integer
  end
end
