# -*- encoding : utf-8 -*-
require 'chinese_pinyin'

class Student < ActiveRecord::Base
  has_and_belongs_to_many :seminars
  belongs_to :klass
  belongs_to :klass2
  belongs_to :zhuanye
  has_many :scholarships
  has_many :assignments
  has_many :talk_records
  has_many :courses,:through=>:assignments
  has_many :chuangyexingdongs_students
  has_many :keyanlixiangs_students
  has_many :kaifangjijins_students
  has_many :chuangyexingdongs,:through=>:chuangyexingdongs_students
  has_many :keyanlixiangs,:through=>:keyanlixiangs_students
  has_many :kaifangjijins,:through=>:kaifangjijins_students
  has_one :graduate_info_item
  before_save :set_paixuzi,:set_surname,:set_number_prefix,:set_qcache
  has_many :watch_list_items
  validates_uniqueness_of :number,:unless=>'nil==self.number'
  def role2human(role)
  	if 'member'==role
  		['成员','参与了']
  	else
  		['负责人','主持了']
  	end
  end
  def klass2human(klass)
  	klass=klass.to_s
  	case klass
  	when 'Chuangyexingdong'
  		'首都师范大学大学生创新性实验计划（教务处项目）'
  	when 'Kaifangjijin'
  		'开放基金（条装处项目）'
  	when 'Keyanlixiang'
  		'本科生科研立项（学生处项目）'
  	end
  end
  def prj_descriptions
  	arr = []
		[:chuangyexingdongs_students,:keyanlixiangs_students,:kaifangjijins_students].each do |method_name|
			self.send(method_name).each do |it|
				item = it.student
				prj = it.send(method_name.to_s.split('_')[0][0..-2])
				arr << "#{self.role2human(it.role)[1]}#{prj.year}年度的#{self.klass2human(prj.class)}“#{prj.name}”"
			end
		end
  	arr
  end
  def yixiu
    ret = 0
    self.assignments.where('score>=60').each{|ass| ret+=ass.course.credit}
    ret
  end
  def bujige
    ret = 0
    self.assignments.where('score<60').each{|ass| ret+=ass.course.credit}
    ret
  end
  def has_xueqi
  	ret = 1
    ret = Time.now.strftime("%y").to_i - self.klass.grade.name.to_i if self.klass and self.klass.grade
    ret *= 2
    ret -= 1 if Time.now.strftime("%m").to_i < 9
  end
  def xb
    if self.is_male
      return '男'
    else
      return '女'
    end
  end
  def banji
    s=''
    if self.klass and self.klass.grade
			s+=self.klass.grade.name+'级'
		end
		s+=self.klass.name+'班' if self.klass
		s
	end
	def pinyin
    Pinyin.t(self.name,'')
  end

protected
  def set_qcache
      self.qcache1 = "[#{self.number}] #{self.name}"
      self.qcache2 = Pinyin.t("#{self.name}",'')
    return true
  end

  def set_paixuzi
  	return true if !self.name
    family_name = FamilyName.find_or_create_by_hanzi(self.name[0])
    self.paixuzi=family_name.letter
  end
  
  def set_surname
	  return true if !self.name
    self.surname = self.name[0]
  end
  
  def set_number_prefix
  	return true if !self.number
    self.number_prefix = self.number[0..6]
  end
end
