class ConvertVarcharsToText < ActiveRecord::Migration
  def self.up
    drop_table :bbqs
    create_table :bbqs do |t|
      t.string :title
      t.date :event_date
      t.text :content
      t.integer :venue_id
      t.boolean :is_published, :default=>false

      t.timestamps
    end
  end

  def self.down
  end
end
