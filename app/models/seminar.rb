# -*- encoding : utf-8 -*-
class Seminar < ActiveRecord::Base
  has_and_belongs_to_many :students
end
