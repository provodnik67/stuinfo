class Import7LogsController < ApplicationController
  # GET /import7_logs
  # GET /import7_logs.xml
  def index
    @import7_logs = Import7Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @import7_logs }
    end
  end

  # GET /import7_logs/1
  # GET /import7_logs/1.xml
  def show
    @import7_log = Import7Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @import7_log }
    end
  end

  # GET /import7_logs/new
  # GET /import7_logs/new.xml
  def new
    @import7_log = Import7Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @import7_log }
    end
  end

  # GET /import7_logs/1/edit
  def edit
    @import7_log = Import7Log.find(params[:id])
  end

  # POST /import7_logs
  # POST /import7_logs.xml
  def create
    @import7_log = Import7Log.new(params[:import7_log])

    respond_to do |format|
      if @import7_log.save
        format.html { redirect_to(@import7_log, :notice => 'Import7 log was successfully created.') }
        format.xml  { render :xml => @import7_log, :status => :created, :location => @import7_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @import7_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /import7_logs/1
  # PUT /import7_logs/1.xml
  def update
    @import7_log = Import7Log.find(params[:id])

    respond_to do |format|
      if @import7_log.update_attributes(params[:import7_log])
        format.html { redirect_to(@import7_log, :notice => 'Import7 log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @import7_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /import7_logs/1
  # DELETE /import7_logs/1.xml
  def destroy
    @import7_log = Import7Log.find(params[:id])
    @import7_log.destroy

    respond_to do |format|
      format.html { redirect_to(import7_logs_url) }
      format.xml  { head :ok }
    end
  end
end
