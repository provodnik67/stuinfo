# -*- encoding : utf-8 -*-
# 学生成绩信息
# 调用示例： 
# im = ImportJob.new(filename:'09级3班.xls',current_user_id:1)
# im.perform

require 'spreadsheet'
class ImportJob
  @queue = :q145
  def self.perform(params)
	  params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/score/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/score/"+params["filename"]
    importLog = ImportLog.create!(co_count:0,co_no_count:0,user_id:params["current_user_id"],course_created_count:0,stu_created_count:0,erroneous:true)
    @msg = ''
    begin
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      p @msg +='警告：发现该xls文件含有多个工作表，只处理第一个。<br>' if worksheets.count != 1
      worksheet = worksheets.first
      raise RuntimeError,'数据表必须为15列，其中第1列为空列；第1行的第2列为标题' unless worksheet.row(0).size==15
      title = worksheet.row(0)[1]
      raise RuntimeError,'标题不可以为空' unless title and title!=''
      raise RuntimeError,'标题必须以sx开始' unless title[0..1]=='sx'
      raise RuntimeError,'标题必须匹配正则表达式^\D+(\d+)(.*)班' unless title =~ /^\D+(\d+)(.*)班/
      grade_name = $1
      klass_name = $2
      klass_name = klass_name[1..-1] if klass_name[0]=='B'
      grade = Grade.find_by_name(grade_name)
      if !grade
        grade = Grade.create!(name:grade_name)
        p @msg+="创建年级#{grade.name}<br><br>"
      end
      klass = grade.klasses.find_or_create_by_name_and_grade_id(klass_name,grade.id)
      if 0==klass.students.count
        p @msg+="创建班级#{klass.name}(属于年级:#{grade.name})<br><br>"
      end
      importLog.grade_created = grade.name
      importLog.klass_created = klass.name
      course_id = Array.new
      #Step 1: Create all the courses{
        row_one = worksheet.row(1) #numbers
        row_two = worksheet.row(2) #names
        row_three = worksheet.row(3) #credits
        size = row_one.size
        raise RuntimeError,'列数不同？' if size != row_two.size or size != row_three.size
        while row_one[size-1]==nil
          size -= 1
        end
        5.upto(size-1) do |i|
          course = Course.find_by_number(row_one[i].strip)
          if !course
            course = Course.create!(number:row_one[i].strip,name:row_two[i].strip,credit:row_three[i].strip)
            importLog.course_created_count += 1
          end
          course_id[i] = course.id
        end
      #}
      #Step 2: Students {
      j=5
      while true
        row = worksheet.row(j)
        break if row.empty? or !row[1] or !row[4]
        number = row[1].strip!
        name = row[4].strip!
        student = Student.find_by_number(number)
        if !student
          student = klass.students.create!(number:number,name:name)
          importLog.stu_created_count += 1
        else
          student.update_attributes!(klass_id:klass.id)
        end
        FamilyName.letExist!(student.name[0])
        5.upto(size-1) do |i|
          row[i].strip!
          next if row[i]=="-"
          if row[i]=="优秀"
            row[i]="90"
          elsif row[i]=="良好"
            row[i]="80"
          elsif row[i]=="中等"
            row[i]="70"
          elsif row[i]=="不及格"
            row[i]="59"
          end
          co = Assignment.where(course_id:course_id[i],student_id:student.id).first
          if co
            importLog.co_no_count+=1
            co.update_attributes!(score:row[i])
          else
            co = Assignment.create!(course_id:course_id[i],student_id:student.id,score:row[i])
            importLog.co_count +=1
          end
          #p @msg += "<span style=\"color:red\">" if co.score<60
          #p @msg += "[ #{name}, #{co.course.name}, #{co.score} ]"
          #p @msg += "</span>" if co.score<60
          #p @msg += "<br>"
        end
        j+=1
      end
      #}
      p @msg += "<br>新课程记录创建：#{importLog.course_created_count}条" if importLog.course_created_count>0
      p @msg += "<br><br>已创建#{importLog.stu_created_count}条新学生记录" if importLog.stu_created_count>0
      p @msg += "<br><br>已导入 #{importLog.co_count} 条新的学生成绩记录<br><br> （#{importLog.co_no_count}条成绩覆写记录）"
      @cont = nil
      p @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      importLog.erroneous = false
    rescue Exception => e
      p @msg += "错误：#{e}<br><br>"
      p @msg += e.backtrace.first
    end
    p importLog.msg = @msg
    importLog.save!
  end
  
  
end


