class CreateWarningChengjiStudents < ActiveRecord::Migration
  def self.up
    create_table :warning_chengji_students do |t|
    t.integer  "student_id"
    t.float    "val"
      t.timestamps
    end
  end

  def self.down
    drop_table :warning_chengji_students
  end
end
