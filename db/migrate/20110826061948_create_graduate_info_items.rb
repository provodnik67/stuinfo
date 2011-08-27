# -*- encoding : utf-8 -*-
class CreateGraduateInfoItems < ActiveRecord::Migration
  def self.up
    create_table :graduate_info_items do |t|
      t.integer :student_id
      t.string :where
      t.text :memo

      t.timestamps
    end
  end

  def self.down
    drop_table :graduate_info_items
  end
end
