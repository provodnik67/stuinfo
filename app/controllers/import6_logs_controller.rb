class Import6LogsController < ApplicationController
  # GET /import6_logs
  # GET /import6_logs.xml
  def index
    @import6_logs = Import6Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import6_logs }
    end
  end

  # GET /import6_logs/1
  # GET /import6_logs/1.xml
  def show
    @import6_log = Import6Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import6_log }
    end
  end

  # GET /import6_logs/new
  # GET /import6_logs/new.xml
  def new
    @import6_log = Import6Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import6_log }
    end
  end

  # GET /import6_logs/1/edit
  def edit
    @import6_log = Import6Log.find(params[:id])
  end

  # POST /import6_logs
  # POST /import6_logs.xml
  def create
    @import6_log = Import6Log.new(params[:import6_log])

    respond_to do |format|
      if @import6_log.save
        format.html { redirect_to(@import6_log, :notice => 'Import6 log was successfully created.') }
        format.xml  { render :xml => @import6_log, :status => :created, :location => @import6_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import6_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import6_logs/1
  # PUT /import6_logs/1.xml
  def update
    @import6_log = Import6Log.find(params[:id])

    respond_to do |format|
      if @import6_log.update_attributes(params[:import6_log])
        format.html { redirect_to(@import6_log, :notice => 'Import6 log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import6_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import6_logs/1
  # DELETE /import6_logs/1.xml
  def destroy
    @import6_log = Import6Log.find(params[:id])
    @import6_log.destroy

    respond_to do |format|
      format.html { redirect_to(import6_logs_url) }
      format.xml  { head :ok }
    end
  end
end
