class SampleBandData < ActiveRecord::Migration
  def self.up
    Band.create(:name=>"Builder", :play_date=>"2010-10-10", :start_time=>"11:00", :end_time=>"11:45", :bbq_id=>1)
    Band.create(:name=>"Destroyer", :play_date=>"2010-10-10", :start_time=>"10:00", :end_time=>"10:45", :bbq_id=>1)
    Band.create(:name=>"Beginner", :play_date=>"2010-10-10", :start_time=>"12:00", :end_time=>"2:00 AM", :bbq_id=>1)
    Band.create(:name=>"Ender", :play_date=>"2010-10-11", :start_time=>"8:00", :end_time=>"9:00", :bbq_id=>1)
    Band.create(:name=>"Ender's Game", :play_date=>"2010-10-11", :start_time=>"9:00", :end_time=>"10:00", :bbq_id=>1)

    Band.create(:name=>"2Builder", :play_date=>"2010-10-20", :start_time=>"11:00", :end_time=>"11:45", :bbq_id=>2)
    Band.create(:name=>"2Destroyer", :play_date=>"2010-10-21", :start_time=>"10:00", :end_time=>"10:45", :bbq_id=>2)
    Band.create(:name=>"2Beginner", :play_date=>"2010-10-21", :start_time=>"12:00", :end_time=>"2:00 AM", :bbq_id=>2)
    Band.create(:name=>"2Ender", :play_date=>"2010-10-20", :start_time=>"8:00", :end_time=>"9:00", :bbq_id=>2)
    Band.create(:name=>"2Ender's Game", :play_date=>"2010-10-20", :start_time=>"9:00", :end_time=>"10:00", :bbq_id=>2)
  end

  def self.down
    Band.delete_all
  end
end
