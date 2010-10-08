class CreateBbqs < ActiveRecord::Migration
  def self.up
    create_table :bbqs do |t|
      t.string :title
      t.date :event_date
      t.string :content
      

      t.timestamps
    end
  end

  def self.down
    drop_table :bbqs
  end
end
