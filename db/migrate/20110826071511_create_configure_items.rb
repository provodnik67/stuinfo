# -*- encoding : utf-8 -*-
class CreateConfigureItems < ActiveRecord::Migration
  def self.up
    create_table :configure_items do |t|
			t.string :key
			t.text :value
      t.timestamps
    end
  end

  def self.down
    drop_table :configure_items
  end
end
