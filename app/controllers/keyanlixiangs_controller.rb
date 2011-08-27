class KeyanlixiangsController < ApplicationController
  # GET /keyanlixiangs
  # GET /keyanlixiangs.xml
  def index
    @keyanlixiangs = Keyanlixiang.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @keyanlixiangs }
    end
  end

  # GET /keyanlixiangs/1
  # GET /keyanlixiangs/1.xml
  def show
    @keyanlixiang = Keyanlixiang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @keyanlixiang }
    end
  end

  # GET /keyanlixiangs/new
  # GET /keyanlixiangs/new.xml
  def new
    @keyanlixiang = Keyanlixiang.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @keyanlixiang }
    end
  end

  # GET /keyanlixiangs/1/edit
  def edit
    @keyanlixiang = Keyanlixiang.find(params[:id])
  end

  # POST /keyanlixiangs
  # POST /keyanlixiangs.xml
  def create
    @keyanlixiang = Keyanlixiang.new(params[:keyanlixiang])

    respond_to do |format|
      if @keyanlixiang.save
        format.html { redirect_to(@keyanlixiang, :notice => 'Keyanlixiang was successfully created.') }
        format.xml  { render :xml => @keyanlixiang, :status => :created, :location => @keyanlixiang }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @keyanlixiang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keyanlixiangs/1
  # PUT /keyanlixiangs/1.xml
  def update
    @keyanlixiang = Keyanlixiang.find(params[:id])

    respond_to do |format|
      if @keyanlixiang.update_attributes(params[:keyanlixiang])
        format.html { redirect_to(@keyanlixiang, :notice => 'Keyanlixiang was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @keyanlixiang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keyanlixiangs/1
  # DELETE /keyanlixiangs/1.xml
  def destroy
    @keyanlixiang = Keyanlixiang.find(params[:id])
    @keyanlixiang.destroy

    respond_to do |format|
      format.html { redirect_to(keyanlixiangs_url) }
      format.xml  { head :ok }
    end
  end
end
