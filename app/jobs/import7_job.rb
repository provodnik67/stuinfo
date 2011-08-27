# -*- encoding : utf-8 -*-
# 开放基金（条装处项目）
# 调用示例： 
# Import7Job.new(filename:'开放基金.xls',current_user_id:1).perform

require 'spreadsheet'
class Import7Job
  @queue = :q145
  def self.perform(params)
    params[:filepath] = "#{Rails.root}/data/kaifangjijin/"+params["filename"]
    importLog = Import7Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    @msg = ''
    begin
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      @msg += params[:filepath].split('/')[-1]+"<br><br>"
      @msg +='警告：发现该xls文件含有多个工作表，只处理第一个。<br>' if worksheets.count != 1
      worksheet = worksheets.first
      empty_j = 0
      j = 3
      while true
        row = worksheet.row(j)
        break if !row[5]
        instance = Kaifangjijin.find_or_create_by_name("#{row[5]}")
        instance.zongxuhao=row[0]
        instance.fenniandu_xuhao = row[1]
        instance.year = row[2]
        instance.yuanxi=row[3]
        instance.bianhao=row[4]
        
        instance.fuzeren=row[6]
        instance.fuzeren_xuehao=row[7]
        instance.members=row[8]
        instance.teacher=row[9]
        instance.jietiqingkuang=row[10]
        instance.memo=row[11]
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

      @msg += "<br>已创建#{importLog.students_created}条新学生记录" if importLog.students_created>0
      @msg += "<br><br>已更新#{importLog.students_updated}条记录" if importLog.students_updated>0
      @cont = nil

      @msg = "<span style=\"color:green\">全部完成</span><br><br>" + @msg
      importLog.erroneous = false

    rescue Exception => e
      @msg += "错误：#{e}<br><br>"
      @msg += e.backtrace.first
    end
    importLog.msg = @msg
    importLog.save!
  end
  
  
end

