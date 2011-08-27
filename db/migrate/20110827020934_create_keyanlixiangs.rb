class CreateKeyanlixiangs < ActiveRecord::Migration
  def self.up
    create_table :keyanlixiangs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :keyanlixiangs
  end
end
