# -*- encoding : utf-8 -*-
class JobAddMore < ActiveRecord::Migration
  def self.up
	  add_column :delayed_jobs,:is_static,:boolean
	  add_column :delayed_jobs,:static_token,:string
		add_column :delayed_jobs,:cyclic,:datetime
  end

  def self.down
  	  remove_column :delayed_jobs,:is_static,:boolean
	  remove_column :delayed_jobs,:static_token,:string
		remove_column :delayed_jobs,:cyclic,:datetime
  end
end
