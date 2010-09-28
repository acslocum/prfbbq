class AddEventDateAndTicketUrlToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :event_date, :date
    add_column :articles, :ticket_url, :string
    Article.update(1, :event_date=>"2010-10-10", :ticket_url=>"http://www.google.com")
    Article.update(2, :event_date=>"2010-10-20", :ticket_url=>"http://www.yahoo.com")
  end

  def self.down
    remove_column :articles, :event_date
    remove_column :articles, :ticket_url
  end
end
