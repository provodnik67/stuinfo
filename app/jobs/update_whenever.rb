# -*- encoding : utf-8 -*-

class UpdateWhenever
  @queue = :q145
  def self.perform(params=nil)
		p `whenever --update-crontab`
  end  
end

