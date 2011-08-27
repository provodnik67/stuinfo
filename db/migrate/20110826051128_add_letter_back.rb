# -*- encoding : utf-8 -*-
class AddLetterBack < ActiveRecord::Migration
  def self.up
  	add_column :family_names,:letter,:string
  end

  def self.down
  	remove_column :family_names,:letter
  end
end
