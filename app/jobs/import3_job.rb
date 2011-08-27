# -*- encoding : utf-8 -*-
# 奖学金
# 调用示例： 
# Import3Job.new(filename:'2010单项奖学金.xls',current_user_id:1).perform

require 'spreadsheet'
class Float
  def strip
    self
  end
end
class Import3Job
  @queue = :q145
  def self.perform(params)
    params[:filepath] = "#{Rails.root}/data/huojiang/"+params["filename"]
    import3Log = Import3Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    @msg = ''
    begin
      student_created = student_updated = nil
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      @msg += params[:filepath].split('/')[-1]+"<br><br>"
      @msg +='警告：发现该xls文件含有多个工作表，只处理第一个。<br>' if worksheets.count != 1
      worksheet = worksheets.first
      firstrow = worksheet.row(0)
      huojiangdengji_first = firstrow.index('获奖等级')
      huojiangdengji_first ||= firstrow.index('奖项')
      jin_e_first = firstrow.index('金额')
      number_first = firstrow.index('学号')
      name_first = firstrow.index('姓名')
      
      if !huojiangdengji_first or !number_first
        p firstrow = worksheet.row(1)
        p huojiangdengji_first = firstrow.index('获奖等级')
        p huojiangdengji_first ||= firstrow.index('奖项')
        p jin_e_first = firstrow.index('金额')
        p number_first = firstrow.index('学号')
        p name_first = firstrow.index('姓名')
      end
      raise RuntimeError,'不能没有获奖等级 金额 学号 姓名' if !huojiangdengji_first or !number_first
      yuanxi_first = worksheet.row(0).index('院系')
      yuanxi_first ||= worksheet.row(1).index('院系')
      event = String.new(File.basename(params[:filepath]))
      j = 1
      while true
        row = worksheet.row(j)
        break if !row or row.empty? or !row[number_first] or !row[name_first] 
        j+=1 and next if yuanxi_first and !(row[yuanxi_first] =~ /数学/)
        if row[number_first].class == Float
          row[number_first] = row[number_first].to_i
        end
        number = row[number_first].to_s.strip
        name = row[name_first].to_s.strip
        student = Student.find_by_number(number)
        if !student
          student = Student.new
          student.number = number.to_s
          student.name = name.to_s
          student.save!
          @msg += "创建学生 #{student.name}<br>"
          import3Log.students_created+=1
        end
        @msg += "学生 #{number} - #{student.name}"
        if !student.scholarships.find_by_event(event)
          if jin_e_first
            jin_e = row[jin_e_first].to_i
          else
            jin_e = 0
          end
          student.scholarships.create!(level:row[huojiangdengji_first],acount:jin_e,event:event)
          @msg += " - #{jin_e}元 - #{event}"
        end
        @msg += "<br>"
        import3Log.students_updated += 1
        student.save!
        j+=1
      end
      @msg += "<br>已创建#{import3Log.students_created}条新学生记录" if import3Log.students_created>0
      @msg += "<br><br>已更新#{import3Log.students_updated}条记录" if import3Log.students_updated>0
      @cont = nil
      @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      import3Log.erroneous = false
    rescue Exception => e
      @msg += "错误：#{e}<br><br>"
      @msg += e.backtrace.first
    end
    import3Log.msg = @msg
    import3Log.save!
  end
  
  
end

