class RealWarnings < ActiveRecord::Migration
  def self.up
  create_table 'warnings',:force=>true do |t|
      t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
    t.integer  "user_id"
    end
  end

  def self.down
  end
end
