# -*- encoding : utf-8 -*-
# 讲座
# 调用示例： 
# Import4Job.new(filename:'提高师范生实践能力平台介绍.xls',current_user_id:1).perform

require 'spreadsheet'
class Float
  def strip
    self
  end
end
class Import4Job
  @queue = :q145
  def self.perform(params)
    params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/jiangzuo/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/jiangzuo/"+params["filename"]
    import4Log = Import4Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    @msg = ''
    begin
      student_created = student_updated = nil
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      ttt=''
      worksheets.each do |worksheet|
        event = String.new(File.basename(params[:filepath]).split('.')[0..-2].join('.').strip)
        sem = Seminar.find_or_create_by_name(event)
        memo = ''
        j = 0
        empty_j = 0
        while true
          row = worksheet.row(j)
          if row.empty?
            empty_j += 1
          else
            empty_j = 0
          end
          break if empty_j > 10
          row.each do |cell|
            next unless cell
            cell = cell.to_i if cell.class==Float
            cell = cell.to_s
            cell.strip!
            if cell=~/^(\d+)$/
              if stu = Student.find_by_number($1)
                unless stu.seminars.include?(sem)
                  stu.seminars << sem
                  stu.save!
                end
              end
            else
              memo+= " #{cell}"
            end
          end
          j+=1
        end
        sem.memo = memo.strip if !sem.memo
        sem.save!
      end

      p @msg += "<br>已创建#{import4Log.students_created}条新学生记录" if import4Log.students_created>0
      p @msg += "<br><br>已更新#{import4Log.students_updated}条记录" if import4Log.students_updated>0
      @cont = nil

      p @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      import4Log.erroneous = false

    rescue Exception => e
      p @msg += "错误：#{e}<br><br>"
      p @msg += e.backtrace.to_s
    end
    import4Log.msg = @msg
    import4Log.save!
  end
  
  
end

