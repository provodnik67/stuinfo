class CreateChuangyexingdongs < ActiveRecord::Migration
  def self.up
    create_table :chuangyexingdongs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :chuangyexingdongs
  end
end
