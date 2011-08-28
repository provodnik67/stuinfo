# -*- encoding : utf-8 -*-
class Kaifangjijin < ActiveRecord::Base
	has_many :kaifangjijins_students
  has_many :students,:through=>:kaifangjijins_students
  def analyse_fuzeren!(importLog=nil)
    students_created=0
    students_updated=0
    return true if !self.fuzeren
    return true if ""==self.fuzeren
    self.fuzeren = self.fuzeren.split(' ').join('').split('　').join('').strip
    s = Student.find_or_create_by_name(self.fuzeren.to_s)
    if !s.number
      students_created+=1
    else
      students_updated+=1
    end
    cs = KaifangjijinsStudent.find_or_create_by_student_id_and_kaifangjijin_id(s.id,self.id)
    cs.role = 'master'
    cs.save!
    s.save!
    if importLog
      importLog.students_created+=students_created
      importLog.students_updated+=students_updated
    end
  end
  
  def analyse_members!(importLog=nil)
    students_created=0
    students_updated=0
    mem = self.members
    return true if !mem
    mem = mem.split('、')
    mem = mem.join('，').split('，')
    mem = mem.join(',').split(',')
    if 1==mem.size
      arr = mem[0].split(/ |　/)
      ok_to_do_this = true
      arr.each {|ele| ok_to_do_this = false if ele.length<=1}
      mem = arr if ok_to_do_this
    end
    mem.each do |name|
      next if !name
      next if ""==name
      name = name.split(' ').join('').split('　').join('').strip
      s = Student.find_or_create_by_name(name)
      if !s.number
        students_created+=1
      else
        students_updated+=1
      end
      cs = KaifangjijinsStudent.find_or_create_by_student_id_and_kaifangjijin_id(s.id,self.id)
      cs.role = 'member'
      cs.save!
      s.save!
    end
    if importLog
      importLog.students_created+=students_created
      importLog.students_updated+=students_updated
    end
  end
  
  
end

