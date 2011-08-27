# -*- encoding : utf-8 -*-
module ApplicationHelper
  def a_href_order(text,name)
#    request.path =~ /(.*)[?](.*)$/
    if @order == name
      return link_to(text,"#{request.path}?order=#{name} desc")
    else
      return link_to(text,"#{request.path}?order=#{name}")
#      return eval('link_to(text,'+controller.controller_name+'_path(order:"#{name}"))').html_safe
    end
  end
  def get_config_input(arg)
	  conf=ConfigureItem.find_by_key(arg.to_s)
	  if conf
	  	str = conf.value
	  else
	  	str =''
	  end
	  ('<input type="text" name="conf['+arg.to_s+']" value="'+str+'" style="width:99%">').html_safe
  end
  def star
    return '<img src="/images/default/star.gif" />'
  end
  def dateGap(date)
    days = Date.today - date
    if days<=31
      return "#{days.to_i}天以前"
    elsif days<=365
      return "#{(days/30).to_i}个月以前"
    else
      return "#{(days/365).to_i}年以前"
    end
  end
end
