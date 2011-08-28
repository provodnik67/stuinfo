# -*- encoding : utf-8 -*-
class Chuangyexingdong < ActiveRecord::Base
	has_many :chuangyexingdongs_students
  has_many :students,:through=>:chuangyexingdongs_students
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
    s.telephone = self.telephone
    cs = ChuangyexingdongsStudent.find_or_create_by_student_id_and_chuangyexingdong_id(s.id,self.id)
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
    members = [self.member1,self.member2,self.member3,self.member4]
    members.each do |name|
      next if !name
      next if ""==name
      name = name.split(' ').join('').split('　').join('').strip
      s = Student.find_or_create_by_name(name)
      if !s.number
        students_created+=1
      else
        students_updated+=1
      end
      cs = ChuangyexingdongsStudent.find_or_create_by_student_id_and_chuangyexingdong_id(s.id,self.id)
      cs.role = 'member'
      cs.save!
      p s if !s.valid?
      s.save!
    end
    if importLog
      importLog.students_created+=students_created
      importLog.students_updated+=students_updated
    end
  end
end

