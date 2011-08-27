# -*- encoding : utf-8 -*-
class WatchListItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :student
end
