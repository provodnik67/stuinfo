# -*- encoding : utf-8 -*-
class AddMsgToLog < ActiveRecord::Migration
  def self.up
  	add_column :import_logs,:msg,:text
  	add_column :import2_logs,:msg,:text
  	add_column :import3_logs,:msg,:text
  	add_column :import4_logs,:msg,:text
  	add_column :import5_logs,:msg,:text
  	add_column :import6_logs,:msg,:text
  	add_column :import7_logs,:msg,:text
  end

  def self.down
   	remove_column :import_logs,:msg
  	remove_column :import2_logs,:msg
  	remove_column :import3_logs,:msg
  	remove_column :import4_logs,:msg
  	remove_column :import5_logs,:msg
  	remove_column :import6_logs,:msg
  	remove_column :import7_logs,:msg
  end
end
