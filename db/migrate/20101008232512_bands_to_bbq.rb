class BandsToBbq < ActiveRecord::Migration
  def self.up
    add_column :bands, :bbq_id, :integer
    add_column :bands, :play_date, :date
    add_column :bands, :start_time, :string
    add_column :bands, :end_time, :string
  end

  def self.down
    remove_column :bands, :bbq_id
    remove_column :bands, :play_date
    remove_column :bands, :start_time
    remove_column :bands, :end_time
  end
end
