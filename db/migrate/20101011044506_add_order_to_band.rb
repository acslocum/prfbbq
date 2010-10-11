class AddOrderToBand < ActiveRecord::Migration
  def self.up
    add_column :bands, :order, :integer
  end

  def self.down
    remove_column :bands, :order
  end
end
