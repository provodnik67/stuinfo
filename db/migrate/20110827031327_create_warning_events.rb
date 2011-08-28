class CreateWarningEvents < ActiveRecord::Migration
  def self.up
    create_table :warning_events do |t|
    t.integer  "student_id"
    t.text    "val"
      t.timestamps
    end
  end

  def self.down
    drop_table :warning_events
  end
end
