# -*- encoding : utf-8 -*-
class Warning < ActiveRecord::Base
	belongs_to :user
	belongs_to :student
end
