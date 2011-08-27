# -*- encoding : utf-8 -*-

class WarningCheckJob
  @queue = :q145
  def self.perform(params=nil)
		WarningXuefenStudent.delete_all
		Student.all.each do |s|
		  val = s.yixiu*1.0/s.has_xueqi
		  next if val==0
		  p "#{s.name}:#{val}"
		  WarningXuefenStudent.create!(student_id:s.id,val:val) if val < ConfigureItem["warnings_credit_threshold"].to_f
		end
  end  
end

