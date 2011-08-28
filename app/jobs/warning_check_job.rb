# -*- encoding : utf-8 -*-

class WarningCheckJob
  @queue = :q145
  def self.perform(params=nil)
  	p "WarningCheckJob"
  	p "with #{params}"
		return unless params
		case params['type']
		when 'xuefen'
			WarningXuefenStudent.delete_all
			Student.all.each do |s|
				val = s.yixiu*1.0/s.has_xueqi
				next if val==0
				p "#{s.name}:#{val}"
				WarningXuefenStudent.create!(student_id:s.id,val:val) if val < ConfigureItem["warnings_xuefen_threshold"].to_f
			end
		when 'chengji'
			WarningChengjiStudent.delete_all
			Student.all.each do |s|
				val = s.assignments.where('score<60').count
				next if val==0
				p "#{s.name}:#{val}"
				WarningChengjiStudent.create!(student_id:s.id,val:val) if val > ConfigureItem["warnings_chengji_threshold"].to_f
			end
		when 'shijian'
			WarningEvent.delete_all
			WatchListItem.all.each do |item|
				s = item.student
				s.talk_records.each do |tr|
					WarningEvent.create!(student_id:s.id,val:"#{s.name}与#{tr.talker}谈话")
				end
				s.scholarships.each do |ass|
					WarningEvent.create!(student_id:s.id,val:"#{s.name}获得了#{ass.event_formatted} #{ass.level}奖学金#{ass.acount}元")
				end
				s.assignments.where('score<60').each do |ass|
					WarningEvent.create!(student_id:s.id,val:"#{s.name}在#{ass.course.name}的考评中不及格")
				end
				s.assignments.where('score>90').each do |ass|
					WarningEvent.create!(student_id:s.id,val:"#{s.name}在#{ass.course.name}的考评中取得优异成绩#{ass.score}分")
				end
				arr  =  s.prj_descriptions
				arr.each do |a|
					WarningEvent.create!(student_id:s.id,val:"#{s.name}在#{a}")
				end
			end
		end
  end  
end

