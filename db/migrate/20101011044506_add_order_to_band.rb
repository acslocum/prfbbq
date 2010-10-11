class AddOrderToBand < ActiveRecord::Migration
  def self.up
    add_column :bands, :sort_order, :integer
  end

  def self.down
    remove_column :bands, :sort_order
  end
end
