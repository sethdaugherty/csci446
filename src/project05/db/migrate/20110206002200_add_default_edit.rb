class AddDefaultEdit < ActiveRecord::Migration
  def self.up
    change_column :articles, :editedCount, :integer, :default => 0
  end

  def self.down
  end
end
