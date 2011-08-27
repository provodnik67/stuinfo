class CreateKaifangjijins < ActiveRecord::Migration
  def self.up


		create_table "chuangyexingdongs", :force => true do |t|
		  t.integer "zongxuhao"
		  t.integer "nianduxuhao"
		  t.integer "year"
		  t.string "yuanxi"
		  t.string "jibie"
		  t.string "zhuangkuang"
		  t.string "chengji"
		  t.string "name"
		  t.string "leibie"
		  t.string "zhuanye"
		  t.string "fuzeren"
		  t.string "fuzeren_xuehao"
		  t.string "telephone"
		  t.string "nianji"
		  t.string "member1"
		  t.string "member2"
		  t.string "member3"
		  t.string "member4"
		  t.string "teacher"
		  t.string "teacher_zhicheng"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		end

		create_table "chuangyexingdongs_students", :force => true do |t|
		  t.integer "chuangyexingdong_id"
		  t.integer "student_id"
		  t.string "role"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		end

		create_table "kaifangjijins", :force => true do |t|
		  t.text "zongxuhao"
		  t.text "fenniandu_xuhao"
		  t.text "year"
		  t.text "yuanxi"
		  t.text "bianhao"
		  t.text "name"
		  t.text "fuzeren"
		  t.text "fuzeren_xuehao"
		  t.text "members"
		  t.text "teacher"
		  t.text "jietiqingkuang"
		  t.text "memo"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		end

		create_table "kaifangjijins_students", :force => true do |t|
		  t.integer "kaifangjijin_id"
		  t.integer "student_id"
		  t.string "role"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		end

		create_table "keyanlixiangs", :force => true do |t|
		  t.string "teacher"
		  t.string "name"
		  t.string "fuzeren"
		  t.string "members"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		  t.string "year"
		end

		create_table "keyanlixiangs_students", :force => true do |t|
		  t.integer "keyanlixiang_id"
		  t.integer "student_id"
		  t.string "role"
		  t.datetime "created_at"
		  t.datetime "updated_at"
		end
  end

  def self.down
    drop_table :kaifangjijins
  end
end
