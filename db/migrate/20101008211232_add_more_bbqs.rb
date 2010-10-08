class AddMoreBbqs < ActiveRecord::Migration
  def self.up
    Bbq.create(:title=> 'NYC BBQ', :content => %{<p>Some text</p>}, :event_date=>"2010-10-20")
    Bbq.create(:title=>"Buffalo WTFBBQ", :content=>"Wild like wings YO", :event_date => "2010-8-30")
    Bbq.create(:title=>"Cleveland BBQ", :content=>"HELLO CLEVELAND", :event_date => "2010-11-30")
  end

  def self.down
  end
end
