# -*- encoding : utf-8 -*-
class ChangeDelayedJobs < ActiveRecord::Migration
  def self.up
  	add_column :delayed_jobs,:title,:string
  end

  def self.down
	  add_column :delayed_jobs,:title
  end
end
