# -*- encoding : utf-8 -*-
class AddQcache12ToUsers < ActiveRecord::Migration
  def self.up
  	add_column :students,:qcache1,:string
  	add_column :students,:qcache2,:string
  end

  def self.down
    	remove_column :students,:qcache1
  	remove_column :students,:qcache2
  end
end
