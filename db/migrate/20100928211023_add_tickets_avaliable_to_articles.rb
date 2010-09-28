class AddTicketsAvaliableToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :tickets_available, :boolean, :default=> true
  end

  def self.down
    remove_column :articles, :tickets_available
  end
end
