class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date :bbq_date
      t.text :content
      t.string :start_time
      t.string :end_time
      t.integer :bbq_id

      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
