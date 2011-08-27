class KaifangjijinsController < ApplicationController
  # GET /kaifangjijins
  # GET /kaifangjijins.xml
  def index
    @kaifangjijins = Kaifangjijin.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kaifangjijins }
    end
  end

  # GET /kaifangjijins/1
  # GET /kaifangjijins/1.xml
  def show
    @kaifangjijin = Kaifangjijin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kaifangjijin }
    end
  end

  # GET /kaifangjijins/new
  # GET /kaifangjijins/new.xml
  def new
    @kaifangjijin = Kaifangjijin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kaifangjijin }
    end
  end

  # GET /kaifangjijins/1/edit
  def edit
    @kaifangjijin = Kaifangjijin.find(params[:id])
  end

  # POST /kaifangjijins
  # POST /kaifangjijins.xml
  def create
    @kaifangjijin = Kaifangjijin.new(params[:kaifangjijin])

    respond_to do |format|
      if @kaifangjijin.save
        format.html { redirect_to(@kaifangjijin, :notice => 'Kaifangjijin was successfully created.') }
        format.xml  { render :xml => @kaifangjijin, :status => :created, :location => @kaifangjijin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kaifangjijin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kaifangjijins/1
  # PUT /kaifangjijins/1.xml
  def update
    @kaifangjijin = Kaifangjijin.find(params[:id])

    respond_to do |format|
      if @kaifangjijin.update_attributes(params[:kaifangjijin])
        format.html { redirect_to(@kaifangjijin, :notice => 'Kaifangjijin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kaifangjijin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kaifangjijins/1
  # DELETE /kaifangjijins/1.xml
  def destroy
    @kaifangjijin = Kaifangjijin.find(params[:id])
    @kaifangjijin.destroy

    respond_to do |format|
      format.html { redirect_to(kaifangjijins_url) }
      format.xml  { head :ok }
    end
  end
end
