# -*- encoding : utf-8 -*-
# 本科生科研立项
# 调用示例： 
# Import6Job.new(filename:'2003-2012年本科生科研立项汇总表.xls',current_user_id:1).perform

require 'spreadsheet'
class Import6Job
  @queue = :q145
  def self.perform(params)
    params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/keyanlixiang/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/keyanlixiang/"+params["filename"]
    importLog = Import6Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    p @msg = ''
    begin
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      p @msg +='警告：发现该xls文件含有多个工作表，只处理第一个。<br>' if worksheets.count != 1
      worksheet = worksheets.first
      empty_j = 0
      j = 2
      year = ""
      while true
        row = worksheet.row(j)
        break if !row[1]
        instance = Keyanlixiang.find_or_create_by_name("#{row[1]}")
        year = row[0].to_s if row[0]
        instance.year = year
        instance.teacher=row[2].to_s
        instance.fuzeren=row[3].to_s
        instance.members=row[4].to_s
        instance.analyse_fuzeren!(importLog)
        instance.analyse_members!(importLog)
        instance.save!
        if row.empty?
          empty_j += 1
        else
          empty_j = 0
        end
        break if empty_j > 10
        j+=1
      end

      p @msg += "<br>已创建#{importLog.students_created}条新学生记录" if importLog.students_created>0
      p @msg += "<br><br>已更新#{importLog.students_updated}条记录" if importLog.students_updated>0
      @cont = nil

      p @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      importLog.erroneous = false

    rescue Exception => e
      p @msg += "错误：#{e}<br><br>"
      p @msg += e.backtrace.first
            p e.backtrace
    end
    importLog.msg = @msg
    importLog.save!
  end
  
  
end

