# -*- encoding : utf-8 -*-
class RemoveColFamilyna < ActiveRecord::Migration
  def self.up
  	remove_column :family_names,"letter"
  	remove_column :family_names,"exists"
  end

  def self.down
	  add_column :family_names,"letter",:string
  	add_column :family_names,"exists",:boolean
  end
end
