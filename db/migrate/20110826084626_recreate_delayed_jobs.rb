# -*- encoding : utf-8 -*-
class RecreateDelayedJobs < ActiveRecord::Migration
  def self.up
    create_table :delayed_jobs, :force => true do |table|
			table.string :schedule
			table.string :code
			table.string :title
      table.timestamps
    end
	
  end

  def self.down
  end
end
