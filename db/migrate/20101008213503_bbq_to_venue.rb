class BbqToVenue < ActiveRecord::Migration
  def self.up
    add_column :bbqs, :venue_id, :integer
  end

  def self.down
    remove_column :bbqs, :venue_id
  end
end
