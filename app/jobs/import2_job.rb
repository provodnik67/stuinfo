# -*- encoding : utf-8 -*-
# 学生整体情况
# 调用示例： 
# Import2Job.new(filename:'2009学生整体情况.xls',current_user_id:1).perform

require 'spreadsheet'
class Float
  def strip
    self
  end
end
class Import2Job
  @queue = :q145
  def self.perform(params)
    params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/info/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/info/"+params["filename"]
    import2Log = Import2Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    p @msg = ''
    begin
      student_created = student_updated = nil
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      p @msg +='警告：发现该xls文件含有多个工作表，只处理第一个。<br>' if worksheets.count != 1
      worksheet = worksheets.first
      firstrow = worksheet.row(0)
      firstrow.each {|column| column.strip!}
      number_first = firstrow.index('xh')
      name_first = firstrow.index('xm')
      bj_first = firstrow.index('bj')
      xb_first = firstrow.index('xb')
      while i=firstrow.index('线')
        firstrow[i]='fenshuxian'
      end
      raise RuntimeError,'不能没有xm或xh列' if !number_first or !name_first
      j = 1
      while true
        row = worksheet.row(j)
        break if row.empty? or !row[number_first] or !row[name_first]
        if row[number_first].class == Float
          row[number_first] = row[number_first].to_i
        end
        number = row[number_first].to_s.strip
        name = row[name_first].to_s.strip
        student = Student.find_by_number(number)
        if student
          import2Log.students_updated += 1
          student_updated = student
        else
          import2Log.students_created += 1
          student = Student.create!(number:number,name:name)
          student_created = student
        end
        unless !bj_first
          raise RuntimeError,'有的学生缺少班级记录' unless row[bj_first]
          student.bj = row[bj_first].strip
          raise RuntimeError,'bj列必须匹配正则表达式^\D+(\d+)(.*)$' unless student.bj =~ /^\D+(\d+)(.*)$/
          grade_name = $1
          klass_name = $2
          klass_name = klass_name[1..-1] if klass_name[0]=='B'
          grade = Grade.find_or_create_by_name(grade_name)
          klass = Klass.find_or_create_by_name_and_grade_id(klass_name,grade.id)
          student.klass_id = klass.id
        end
        unless !xb_first
          if row[xb_first]=='男'
            student.is_male = true
          else
            student.is_male = false
          end
        end
        0.upto(firstrow.count-1) do |i|
          next if 'xh'==firstrow[i] or 'xm'==firstrow[i] or 'xb'==firstrow[i]
          eval("student.#{firstrow[i]} = row[#{i}].strip if row[#{i}]")
        end
        @msg += "[ #{row[number_first]}, #{row[name_first]}, #{student.bj}]<br>"
        FamilyName.letExist!(student.name[0])
        student.save!
        j+=1
      end
      p @msg += "<br>已创建#{import2Log.students_created}条新学生记录" if import2Log.students_created>0
      p @msg += "<br><br>已更新#{import2Log.students_updated}位学生的记录" if import2Log.students_updated>0
      @cont = nil
      p @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      import2Log.erroneous = false
    rescue Exception => e
      p @msg += "错误：#{e}<br><br>"
      p @msg += e.backtrace.first
    end
    import2Log.msg = @msg
    import2Log.save!
  end
  
  
end

