# -*- encoding : utf-8 -*-
# klasses rebuild
# 调用示例： 
# Import8Job.new(filename:'09级分专业后班级名单.xls',current_user_id:1).perform

require 'spreadsheet'
class Import8Job
  @queue = :q145
  def self.perform(params)
    params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/klasses/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/klasses/"+params["filename"]
    #importLog = Import8Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    @msg = ''
    begin
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      worksheets.each do |worksheet|
		    j = 0
		    worksheet_row_count = worksheet.count
				while j<worksheet_row_count
					p "finding #{j}"
				  row = worksheet.row(j)
				  row = row.to_a.collect{|item| item ? item.to_s.strip : nil}
				  xuehao_rowno = row.index('学号')
				  banji_rowno =  row.index('班级')
				  j+=1
				  break if xuehao_rowno and banji_rowno
				end
				next unless xuehao_rowno and banji_rowno
				
		    while j<worksheet_row_count
		      row = worksheet.row(j)
		      p "handling #{row.to_s}"
		      unless row[xuehao_rowno] and row[banji_rowno]
		        j+=1
		        next
		      end
					xuehao  = row[xuehao_rowno].to_s.strip.split('.')[0]
					banji = row[banji_rowno].to_s.strip
		      student = Student.find_by_number(xuehao)
		      unless student
		        j+=1
		        next
		      end
grade=Grade.find_or_create_by_name(banji.split('B')[0])
klass=grade.klasses.find_or_create_by_name(banji.split('B')[1])
student.klass_id = klass.id
student.save!(:validate=>false)
		      j+=1
		    end
			end
#      p @msg += "<br>已创建#{importLog.students_created}条新学生记录" if importLog.students_created>0
#      p @msg += "<br><br>已更新#{importLog.students_updated}条记录" if importLog.students_updated>0
      @cont = nil

      p @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
#      importLog.erroneous = false
			Klass.all.each{|k| k.delete if 0==k.students.count}
			Grade.all.each{|g| g.delete if 0==g.klasses.count}
    rescue Exception => e
      p @msg += "错误：#{e}<br><br>"
      p @msg += e.backtrace.first
            p e.backtrace
    end
    p @msg
#    importLog.msg = @msg
#    importLog.save!
  end
  
  
end

