# -*- encoding : utf-8 -*-

class UpdateKlass2sJob
  @queue = :q145
  def self.perform(params=nil)
		Klass2.delete_all
		Student.all.each do |student|
		  next unless student.klass
		  k = Klass2.where(name:student.zym,grade_id:student.klass.grade_id).first
		  k ||= Klass2.create!(name:student.zym,grade_id:student.klass.grade_id)
		  student.klass2_id = k.id
		  student.save!
		end
  end  
end
