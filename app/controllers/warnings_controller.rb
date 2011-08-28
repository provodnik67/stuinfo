# -*- encoding : utf-8 -*-
class WarningsController < ApplicationController
  before_filter :authenticate_user!


  # GET /warnings
  # GET /warnings.xml
  def index
    @warnings = Warning.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warnings }
    end
  end

  # GET /warnings/1
  # GET /warnings/1.xml
  def show
    @warning = Warning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warning }
    end
  end

  # GET /warnings/new
  # GET /warnings/new.xml
  def new
    @warning = Warning.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warning }
    end
  end

  # GET /warnings/1/edit
  def edit
    @warning = Warning.find(params[:id])
  end

  # POST /warnings
  # POST /warnings.xml
  def create
  	student = parse_from_goto(params[:goto])
  	render text:'无此学生' if !student
    @warning = Warning.find_or_create_by_student_id(student.id)
    @warning.user_id=current_user.id
    @warning.reason=params[:reason]
		if @warning.save
			redirect_to '/warnings',:notice=>'成功创建'
		else
			redirect_to '/warnings',:error=>'失败'
		end
  end

  # PUT /warnings/1
  # PUT /warnings/1.xml
  def update
    @warning = Warning.find(params[:id])

    respond_to do |format|
      if @warning.update_attributes(params[:warning])
        format.html { redirect_to(warnings_path, :notice => '成功更新.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warnings/1
  # DELETE /warnings/1.xml
  def destroy
    @warning = Warning.find(params[:id])
    @warning.destroy

    respond_to do |format|
      format.html { redirect_to(warnings_url) }
      format.xml  { head :ok }
    end
  end
end
