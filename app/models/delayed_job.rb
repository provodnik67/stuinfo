# -*- encoding : utf-8 -*-
class DelayedJob < ActiveRecord::Base
	def self.install
		self.find_by_title_or_create('预警信息检测',:priority=>'5',:schedule=>%q(ConfigureItem['warnings_cycle']),:code=>%q{Resque.enqueue(WarningCheckJob)})
		self.find_by_title_or_create('招生专业门班级列表生成',:priority=>'4',:schedule=>%q(ConfigureItem['klass2s_cycle']),:code=>%q{Resque.enqueue(UpdateKlass2sJob)})
	end
	
	def self.find_by_title_or_create(title,other=nil)
		instance = self.find_or_create_by_title(title)
		instance.update_attributes!(other)
		instance.save!
	end
end
