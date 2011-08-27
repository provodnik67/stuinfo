class Import5LogsController < ApplicationController
  # GET /import5_logs
  # GET /import5_logs.xml
  def index
    @import5_logs = Import5Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import5_logs }
    end
  end

  # GET /import5_logs/1
  # GET /import5_logs/1.xml
  def show
    @import5_log = Import5Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import5_log }
    end
  end

  # GET /import5_logs/new
  # GET /import5_logs/new.xml
  def new
    @import5_log = Import5Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import5_log }
    end
  end

  # GET /import5_logs/1/edit
  def edit
    @import5_log = Import5Log.find(params[:id])
  end

  # POST /import5_logs
  # POST /import5_logs.xml
  def create
    @import5_log = Import5Log.new(params[:import5_log])

    respond_to do |format|
      if @import5_log.save
        format.html { redirect_to(@import5_log, :notice => 'Import5 log was successfully created.') }
        format.xml  { render :xml => @import5_log, :status => :created, :location => @import5_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import5_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import5_logs/1
  # PUT /import5_logs/1.xml
  def update
    @import5_log = Import5Log.find(params[:id])

    respond_to do |format|
      if @import5_log.update_attributes(params[:import5_log])
        format.html { redirect_to(@import5_log, :notice => 'Import5 log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import5_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import5_logs/1
  # DELETE /import5_logs/1.xml
  def destroy
    @import5_log = Import5Log.find(params[:id])
    @import5_log.destroy

    respond_to do |format|
      format.html { redirect_to(import5_logs_url) }
      format.xml  { head :ok }
    end
  end
end
