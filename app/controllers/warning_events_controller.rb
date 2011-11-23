# -*- encoding : utf-8 -*-

class WarningEventsController < ApplicationController
  # GET /warning_events
  # GET /warning_events.xml
  def index
    @warning_events = WarningEvent.order('student_id').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warning_events }
    end
  end

  # GET /warning_events/1
  # GET /warning_events/1.xml
  def show
    @warning_event = WarningEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warning_event }
    end
  end

  # GET /warning_events/new
  # GET /warning_events/new.xml
  def new
    @warning_event = WarningEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warning_event }
    end
  end

  # GET /warning_events/1/edit
  def edit
    @warning_event = WarningEvent.find(params[:id])
  end

  # POST /warning_events
  # POST /warning_events.xml
  def create
        student = parse_from_goto(params[:goto])
        render text:'此学生不存在' and return if !student
    @warning = WarningEvent.new(student_id:student.id)
    @warning.val=params[:reason]
                if @warning.save
                        redirect_to '/warning_events',:notice=>'成功'
                else
                        redirect_to '/warning_events',:error=>'失败'
                end
  end

  # PUT /warning_events/1
  # PUT /warning_events/1.xml
  def update
    @warning_event = WarningEvent.find(params[:id])

    respond_to do |format|
      if @warning_event.update_attributes(params[:warning_event])
        format.html { redirect_to(@warning_event, :notice => 'Warning event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warning_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warning_events/1
  # DELETE /warning_events/1.xml
  def destroy
    @warning_event = WarningEvent.find(params[:id])
    @warning_event.destroy

    respond_to do |format|
      format.html { redirect_to(warning_events_url) }
            format.js { 
        render text:'$("#tr_'+params[:id]+'").hide("fade")'
      }
      format.xml  { head :ok }
    end
  end
end