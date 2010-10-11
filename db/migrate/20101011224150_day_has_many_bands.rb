class DayHasManyBands < ActiveRecord::Migration
  def self.up
    add_column :bands, :day_id, :integer
  end

  def self.down
    drop_column :bands, :day_id
  end
end
