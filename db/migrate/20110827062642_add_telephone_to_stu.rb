class AddTelephoneToStu < ActiveRecord::Migration
  def self.up
  	add_column :students,:telephone,:string
  end

  def self.down
  	remove_column :students,:telephone
  end
end
