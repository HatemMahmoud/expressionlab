class ChangeArticleSummaryToText < ActiveRecord::Migration
  def up
    change_column :articles, :summary, :text
  end

  def down
    change_column :articles, :summary, :string
  end
end
