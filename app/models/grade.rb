# -*- encoding : utf-8 -*-
class Grade < ActiveRecord::Base
  has_many :klasses
  has_many :students,:through=>:klasses
  has_many :klass2s
  
  def talk_records
  	arr=[]
  	self.students.each{|stu| arr += stu.talk_records}
  	arr
 	end
 	
 	def name_grad
 		if self.name.to_i > 0 
 			sprintf("%2d",self.name.to_i+4)
 		else
 			self.name
 		end
 	end
end
