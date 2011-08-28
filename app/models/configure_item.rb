# -*- encoding : utf-8 -*-
class ConfigureItem < ActiveRecord::Base
	def self.install
		self['warnings_xuefen_cycle']='0 0 * * 0'
		self['warnings_xuefen_threshold']='15'
		self['warnings_chengji_cycle']='0 0 * * 0'
		self['warnings_chengji_threshold']='6'
		self['warnings_shijian_cycle']='0 0 * * 0'
		self['klass2s_cycle']='0 0 * * 0'
		true
	end
	
	def self.[](arg)
		r = self.find_by_key(arg)
		if r
		r.value 
		else
		""
		end
	end

	def self.[]=(key,value)
		conf = ConfigureItem.find_or_create_by_key(key)
		conf.value = value
		conf.save!
	end
	
	before_save Proc.new{
		if self.key =~ /_cycle$/ and self.value_changed?
			Resque.enqueue(UpdateWhenever)
		end
	}
end
