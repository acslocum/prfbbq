class AddVenueData < ActiveRecord::Migration
  def self.up
    Venue.delete_all
    quenchers = Venue.create(:name=>"Quenchers Saloon", :url=>"http://www.quenchers.com/", :address=>"2401 N. Western Ave., Chicago, IL 60647")
    morrissey = Venue.create(:name=>"WJ Morrissey Irish Pub", :url=>"http://www.wjmorrissey.com/", :address=>"30 Mississippi St, Buffalo, NY 14203, USA")
    
    chi = Bbq.find(1)
    chi.venue = quenchers
    buf = Bbq.find(2)
    buf.venue = morrissey
    chi.save!
    buf.save!
  end

  def self.down
    Venue.delete_all
  end
end
