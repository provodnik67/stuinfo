# -*- encoding : utf-8 -*-
class GraduateInfoItemsController < ApplicationController
  # GET /graduate_info_items
  # GET /graduate_info_items.xml
  def index
    @graduate_info_items = GraduateInfoItem.all
		@graduate_info_item = GraduateInfoItem.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graduate_info_items }
    end
  end

  # GET /graduate_info_items/1
  # GET /graduate_info_items/1.xml
  def show
    @graduate_info_item = GraduateInfoItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @graduate_info_item }
    end
  end

  # GET /graduate_info_items/new
  # GET /graduate_info_items/new.xml
  def new
    @graduate_info_item = GraduateInfoItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @graduate_info_item }
    end
  end

  # GET /graduate_info_items/1/edit
  def edit
    @graduate_info_item = GraduateInfoItem.find(params[:id])
  end

  # POST /graduate_info_items
  # POST /graduate_info_items.xml
  def create
   	student = parse_from_goto(params[:goto])
  	render text:'无此学生' if !student
    @graduate_info_item = GraduateInfoItem.find_or_create_by_student_id(student.id)
    @graduate_info_item.where = params[:graduate_info_item][:where]
    @graduate_info_item.memo = params[:graduate_info_item][:memo]
		if @graduate_info_item.save
			redirect_to '/graduate_info_items',:notice=>'成功创建'
		else
			redirect_to '/graduate_info_items',:error=>'失败'
		end
  end

  # PUT /graduate_info_items/1
  # PUT /graduate_info_items/1.xml
  def update
    @graduate_info_item = GraduateInfoItem.find(params[:id])

    respond_to do |format|
      if @graduate_info_item.update_attributes(params[:graduate_info_item])
                format.html { redirect_to(graduate_info_items_path, :notice => '成功更新.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @graduate_info_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_info_items/1
  # DELETE /graduate_info_items/1.xml
  def destroy
    @graduate_info_item = GraduateInfoItem.find(params[:id])
    @graduate_info_item.destroy

    respond_to do |format|
      format.html { redirect_to(graduate_info_items_url) }
      format.xml  { head :ok }
    end
  end
end
