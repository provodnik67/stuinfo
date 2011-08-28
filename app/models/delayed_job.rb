# -*- encoding : utf-8 -*-
class DelayedJob < ActiveRecord::Base
	def self.install
		self.find_by_title_or_create('学分预警信息检测',:priority=>'6',:schedule=>%q(ConfigureItem['warnings_xuefen_cycle']),:code=>%q{Resque.enqueue(WarningCheckJob,:type=>:xuefen)})
		self.find_by_title_or_create('成绩预警信息检测',:priority=>'6',:schedule=>%q(ConfigureItem['warnings_chengji_cycle']),:code=>%q{Resque.enqueue(WarningCheckJob,:type=>:chengji)})
		self.find_by_title_or_create('事件预警信息检测',:priority=>'6',:schedule=>%q(ConfigureItem['warnings_shijian_cycle']),:code=>%q{Resque.enqueue(WarningCheckJob,:type=>:shijian)})
		self.find_by_title_or_create('招生专业门班级列表生成',:priority=>'4',:schedule=>%q(ConfigureItem['klass2s_cycle']),:code=>%q{Resque.enqueue(UpdateKlass2sJob)})
		self.find_by_title_or_create('导入所有学生成绩信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(ImportJob,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有基础信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import2Job,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有奖学金信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import3Job,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有讲座信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import4Job,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有大学生创新性实验计划信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import5Job,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有本科生科研立项信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import6Job,"filename"=>"__ALL__")})
		self.find_by_title_or_create('导入所有开放基金信息',:priority=>'3',:schedule=>'',:code=>%q{Resque.enqueue(Import7Job,"filename"=>"__ALL__")})
	end
	
	def self.find_by_title_or_create(title,other=nil)
		instance = self.find_or_create_by_title(title)
		instance.update_attributes!(other)
		instance.save!
	end
	
	def schedule_text
		if self.schedule and ""!=self.schedule and ""!=eval(self.schedule)
			eval self.schedule
		else
			'手动执行'
		end
	end

end
