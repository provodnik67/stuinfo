# -*- encoding : utf-8 -*-
require 'chinese_pinyin'
class FamilyName < ActiveRecord::Base
	scope :existings,order('letter')
  
  def FamilyName.letExist!(surname)
    fn = FamilyName.find_or_create_by_hanzi(surname)
  end
    
  before_save Proc.new{self.letter=Pinyin.t(self.hanzi,'')[0].downcase;true}
end
