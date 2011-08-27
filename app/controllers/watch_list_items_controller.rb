# -*- encoding : utf-8 -*-
class WatchListItemsController < ApplicationController
  before_filter :authenticate_user!

  # GET /watch_list_items
  # GET /watch_list_items.xml
  def index
    @watch_list_items = WatchListItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @watch_list_items }
    end
  end

  # GET /watch_list_items/1
  # GET /watch_list_items/1.xml
  def show
    @watch_list_item = WatchListItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @watch_list_item }
    end
  end

  # GET /watch_list_items/new
  # GET /watch_list_items/new.xml
  def new
    @watch_list_item = WatchListItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @watch_list_item }
    end
  end

  # GET /watch_list_items/1/edit
  def edit
    @watch_list_item = WatchListItem.find(params[:id])
  end

  # POST /watch_list_items
  # POST /watch_list_items.xml
  def create
  	student = parse_from_goto(params[:goto])
  	render text:'无此学生' if !student
    @watch_list_item = WatchListItem.find_or_create_by_student_id(student.id)
    @watch_list_item.user_id=current_user.id
    @watch_list_item.reason=params[:reason]
		if @watch_list_item.save
			redirect_to '/watch_list_items',:notice=>'成功创建'
		else
			redirect_to '/watch_list_items',:error=>'失败'
		end
  end

  # PUT /watch_list_items/1
  # PUT /watch_list_items/1.xml
  def update
    @watch_list_item = WatchListItem.find(params[:id])

    respond_to do |format|
      if @watch_list_item.update_attributes(params[:watch_list_item])
        format.html { redirect_to(watch_list_items_path, :notice => '成功更新.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @watch_list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /watch_list_items/1
  # DELETE /watch_list_items/1.xml
  def destroy
    @watch_list_item = WatchListItem.find(params[:id])
    @watch_list_item.destroy

    respond_to do |format|
      format.html { redirect_to(watch_list_items_url) }
      format.xml  { head :ok }
    end
  end
end
