class AddPublishFieldToBbqAndArticle < ActiveRecord::Migration
  def self.up
    add_column :bbqs, :is_published, :boolean, :default=>false
    add_column :articles, :is_published, :boolean, :default=>false
  end

  def self.down
    remove_column :bbqs, :is_published
    remove_column :articles, :is_published
  end
end
