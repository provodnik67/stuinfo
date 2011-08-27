class AddPriority < ActiveRecord::Migration
  def self.up
  	add_column :delayed_jobs,:priority,:integer
  end

  def self.down
  	remove_column :delayed_jobs,:priority
  end
end
