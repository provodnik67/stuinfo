# -*- encoding : utf-8 -*-
class AjaxController < ApplicationController
  def autocomplete_student_name
    render text:Student.where('qcache2 like ? or qcache1 like ?','%'+params[:term]+'%','%'+params[:term]+'%').order('name').limit(10).collect(&:qcache1).to_json
  end
end
