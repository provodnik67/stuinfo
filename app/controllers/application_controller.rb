# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_some_variables
  
  def set_some_variables
    unless request.env['HTTP_USER_AGENT'].nil?
      @is_ie = (request.env['HTTP_USER_AGENT'].downcase.index('msie')!=nil)
      @is_ie6 = (request.env['HTTP_USER_AGENT'].downcase.index('msie 6')!=nil)
      @is_ie9 = (request.env['HTTP_USER_AGENT'].downcase.index('msie 9')!=nil)
    end
    flash[:alert] = "推荐您使用非IE核心的浏览器（如<a href=\"http://www.google.com/chrome/\">Chrome</a>），以获得最佳使用体验和使用系统的全部功能；更改浏览器后本提示将消失。".html_safe if @is_ie
    render text:"本科生立体化管理系统 Ver1.5的大量新增功能依赖于非IE浏览器，请更换浏览器（如<a href=\"http://www.google.com/chrome/\">Chrome</a>, <a href=\"www.firefox.com.cn/\">FireFox</a>）。".html_safe and return false if @is_ie
		
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "您没有这个权限."
    redirect_to root_url
  end

private
	def parse_from_goto(goto)
  	if params[:goto]=~/^\[(.*)\]/
  		params[:goto]=$1
  	end
    student = Student.find_by_name(params[:goto])
    return student if student
    student = Student.find_by_number(params[:goto])	
		return student if student
		return nil
	end
	
  def do_it(biao,default)
    cookies_biao = controller_name + '_' + biao.to_s
    unless params[biao]
      params[biao]=default
    else
      cookies[cookies_biao] = params[biao]
    end
    params[biao] = cookies[cookies_biao] if cookies[cookies_biao]
  end

end
