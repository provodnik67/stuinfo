# -*- encoding : utf-8 -*-
# 首都师范大学大学生创新性实验计划（教务处项目）
# 调用示例： 
# Import5Job.new(filename:'创业行动.xls',current_user_id:1).perform

require 'spreadsheet'
class Import5Job
  @queue = :q145
  def self.perform(params)
    params["current_user_id"] = 0
  	if '__ALL__'==params["filename"]
			Dir.glob("#{Rails.root}/data/chuangyexingdong/*.xls") do |filename| 
				params['filename'] = File.basename(filename)
				
				self.perform(params)
			end
			return true
  	end
  	p "doing #{params}"
    params[:filepath] = "#{Rails.root}/data/chuangyexingdong/"+params["filename"]
    importLog = Import5Log.create!(students_updated:0,students_created:0,user_id:params["current_user_id"],erroneous:true)
    p @msg = ''
    begin
      worksheets = Spreadsheet.open(params[:filepath]).worksheets
      p @msg += params[:filepath].split('/')[-1]+"<br><br>"
      p @msg +='警告：只处理第一个工作表，其余工作表将被忽略；请保证一个xls文件只含一个工作表' if worksheets.count != 1
      worksheet = worksheets.first
      empty_j = 0
      j = 4
      while true
        row = worksheet.row(j)
        break if !row[7]
        instance = Chuangyexingdong.find_or_create_by_name(row[7])
        instance.zongxuhao = row[0]
        instance.nianduxuhao=row[1]
        instance.year=row[2]
        instance.yuanxi=row[3]
        instance.jibie=row[4]
        instance.zhuangkuang=row[5]
        instance.chengji=row[6]

        instance.leibie=row[8]
        instance.zhuanye=row[9]
        
        instance.fuzeren=row[10]
        instance.fuzeren_xuehao=row[11]
        instance.telephone=row[12]
        instance.nianji=row[13]
        instance.analyse_fuzeren!(importLog)
        
        instance.member1=row[14]
        instance.member2=row[15]
        instance.member3=row[16]
        instance.member4=row[17]
        instance.analyse_members!(importLog)
        
        instance.teacher=row[18]
        instance.teacher_zhicheng=row[19]
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

