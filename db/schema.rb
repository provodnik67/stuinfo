# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110827021058) do

  create_table "assignments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chuangyexingdongs", :force => true do |t|
    t.integer  "zongxuhao"
    t.integer  "nianduxuhao"
    t.integer  "year"
    t.string   "yuanxi"
    t.string   "jibie"
    t.string   "zhuangkuang"
    t.string   "chengji"
    t.string   "name"
    t.string   "leibie"
    t.string   "zhuanye"
    t.string   "fuzeren"
    t.string   "fuzeren_xuehao"
    t.string   "telephone"
    t.string   "nianji"
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "member4"
    t.string   "teacher"
    t.string   "teacher_zhicheng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chuangyexingdongs_students", :force => true do |t|
    t.integer  "chuangyexingdong_id"
    t.integer  "student_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configure_items", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.integer  "credit"
    t.boolean  "in_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number_prefix"
    t.integer  "assignments_count"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.string   "schedule"
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  create_table "family_names", :force => true do |t|
    t.string   "hanzi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "letter"
  end

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graduate_info_items", :force => true do |t|
    t.integer  "student_id"
    t.string   "where"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import2_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import3_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import4_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import5_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import6_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import7_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "students_updated"
    t.integer  "students_created"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",              :limit => 2147483647
  end

  create_table "import_logs", :force => true do |t|
    t.integer  "user_id"
    t.string   "filename"
    t.string   "grade_created"
    t.string   "klass_created"
    t.integer  "course_created_count"
    t.integer  "stu_created_count"
    t.integer  "co_count"
    t.integer  "co_no_count"
    t.boolean  "erroneous"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "msg",                  :limit => 2147483647
  end

  create_table "kaifangjijins", :force => true do |t|
    t.text     "zongxuhao"
    t.text     "fenniandu_xuhao"
    t.text     "year"
    t.text     "yuanxi"
    t.text     "bianhao"
    t.text     "name"
    t.text     "fuzeren"
    t.text     "fuzeren_xuehao"
    t.text     "members"
    t.text     "teacher"
    t.text     "jietiqingkuang"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kaifangjijins_students", :force => true do |t|
    t.integer  "kaifangjijin_id"
    t.integer  "student_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keyanlixiangs", :force => true do |t|
    t.string   "teacher"
    t.string   "name"
    t.string   "fuzeren"
    t.string   "members"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "keyanlixiangs_students", :force => true do |t|
    t.integer  "keyanlixiang_id"
    t.integer  "student_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "klass2s", :force => true do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "from_user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_read"
  end

  create_table "programs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "researches", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scholarships", :force => true do |t|
    t.integer  "student_id"
    t.string   "level"
    t.integer  "acount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event"
  end

  create_table "seminars", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "memo"
  end

  create_table "seminars_students", :id => false, :force => true do |t|
    t.integer  "seminar_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "number"
    t.string   "bj"
    t.string   "sfh"
    t.string   "mz"
    t.string   "jg"
    t.string   "sbzzmm"
    t.string   "zy"
    t.string   "ksh"
    t.string   "zym"
    t.string   "kq"
    t.string   "wyyz"
    t.string   "lxrxm"
    t.string   "lxrdz"
    t.string   "lxryb"
    t.string   "lxrdh"
    t.string   "kslb"
    t.string   "byzx"
    t.string   "byzxyb"
    t.string   "brtc"
    t.string   "jlcc"
    t.string   "kstz"
    t.string   "tjjljs"
    t.string   "tjsxbzm"
    t.string   "yhkszss"
    t.string   "paixuzi"
    t.text     "ksjl"
    t.boolean  "is_male"
    t.integer  "klass_id"
    t.integer  "fenshuxian"
    t.integer  "rxzf"
    t.integer  "gkzf"
    t.integer  "fjf"
    t.integer  "yw"
    t.integer  "sx"
    t.integer  "wy"
    t.integer  "wl"
    t.integer  "hx"
    t.integer  "zz"
    t.integer  "ls"
    t.integer  "zh"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number_prefix"
    t.integer  "assignments_count"
    t.string   "xsm"
    t.string   "pyfs"
    t.string   "nd"
    t.string   "tzsh"
    t.string   "csrq"
    t.string   "rxny"
    t.string   "bkzy1"
    t.string   "bkzy2"
    t.string   "bkzy3"
    t.string   "bkzy4"
    t.string   "bkzy5"
    t.string   "bkzy6"
    t.string   "zyh"
    t.string   "xsh"
    t.string   "sfl"
    t.string   "wlfl"
    t.string   "lqlb"
    t.integer  "zhuanye_id"
    t.integer  "klass2_id"
    t.string   "qcache1"
    t.string   "qcache2"
  end

  create_table "tables", :force => true do |t|
    t.text     "checked_grades"
    t.text     "checked_klasses"
    t.text     "checked_students"
    t.text     "checked_courses"
    t.text     "checked_courses_quan"
    t.text     "result",               :limit => 2147483647
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "reason",               :limit => 2147483647
  end

  create_table "talk_records", :force => true do |t|
    t.integer  "student_id"
    t.string   "about"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "happened_at"
    t.string   "talker"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.boolean  "is_admin"
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "warning_xuefen_students", :force => true do |t|
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "val"
  end

  create_table "warnings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "watch_list_items", :force => true do |t|
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
    t.integer  "user_id"
  end

  create_table "zhuanyes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
