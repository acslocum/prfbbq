class CreateTestDataForMoreShows < ActiveRecord::Migration
  def self.up
    Article.create(:title=>"Buffalo WTFBBQ", :content=>"Wild like wings YO", :event_date => "2010-8-30", :ticket_url=>"http://www.google.com")
    Article.create(:title=>"Cleveland BBQ", :content=>"HELLO CLEVELAND", :event_date => "2010-11-30", :ticket_url=>"http://www.google.com", :tickets_available=>false)
  end

  def self.down
  end
end
