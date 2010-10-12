class AssociateDayWithVenue < ActiveRecord::Migration
  def self.up
    add_column :days, :venue_id, :integer
  end

  def self.down
    drop_column :days, :venue_id
  end
end
