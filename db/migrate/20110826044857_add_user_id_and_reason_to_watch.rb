# -*- encoding : utf-8 -*-
class AddUserIdAndReasonToWatch < ActiveRecord::Migration
  def self.up
  	add_column :watch_list_items,:reason,:string
  	add_column :watch_list_items,:user_id,:integer
  end

  def self.down
    	remove_column :watch_list_items,:reason
  	remove_column :watch_list_items,:user_id
  end
end
