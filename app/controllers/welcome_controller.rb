# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def menu
    render :layout=>false
  end
  
  def top
    render :layout=>false
  end
  
  def index
    render :layout=>false
  end
  
  def main
  	@grades = Grade.order('name').all
  	@grade_names = @grades.collect(&:name)
    @unread_msg = current_user.messages.where(has_read:false)
  end
  
  def import
  end
  
  def import2
  end

  def import3
  end
  
  def import4
  end
  
  def import567
  end
  def import_upload
  end
  def settings
  end
  
  def update_settings
		params["conf"].each do |key,value|
			c = ConfigureItem.find_or_create_by_key(key)
			c.value = value
			c.save!

		end
		redirect_to "/settings",:notice=>'成功更新' and return
 	end
  
  def auto_import
    if 2==params[:type].to_i
      @action = '/core/import2'
      paths = Dir.glob("#{RAILS_ROOT}/data/info/*.xls")
    elsif 1==params[:type].to_i
      @action = '/core/import'
      paths = Dir.glob("#{RAILS_ROOT}/data/score/*.xls")
    else
      render :text=>'type wrong.' and return
    end
    @filepath = paths[params[:i].to_i]
  end
  
  def shortcut
  	if params[:gid]
  		redirect_to Grade.find(params[:gid])
  	elsif params[:sid]
  		redirect_to Student.find(params[:sid])
  	end
  end
end
