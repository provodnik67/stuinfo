class ChuangyexingdongsController < ApplicationController
  # GET /chuangyexingdongs
  # GET /chuangyexingdongs.xml
  def index
    @chuangyexingdongs = Chuangyexingdong.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chuangyexingdongs }
    end
  end

  # GET /chuangyexingdongs/1
  # GET /chuangyexingdongs/1.xml
  def show
    @chuangyexingdong = Chuangyexingdong.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chuangyexingdong }
    end
  end

  # GET /chuangyexingdongs/new
  # GET /chuangyexingdongs/new.xml
  def new
    @chuangyexingdong = Chuangyexingdong.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chuangyexingdong }
    end
  end

  # GET /chuangyexingdongs/1/edit
  def edit
    @chuangyexingdong = Chuangyexingdong.find(params[:id])
  end

  # POST /chuangyexingdongs
  # POST /chuangyexingdongs.xml
  def create
    @chuangyexingdong = Chuangyexingdong.new(params[:chuangyexingdong])

    respond_to do |format|
      if @chuangyexingdong.save
        format.html { redirect_to(@chuangyexingdong, :notice => 'Chuangyexingdong was successfully created.') }
        format.xml  { render :xml => @chuangyexingdong, :status => :created, :location => @chuangyexingdong }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chuangyexingdong.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chuangyexingdongs/1
  # PUT /chuangyexingdongs/1.xml
  def update
    @chuangyexingdong = Chuangyexingdong.find(params[:id])

    respond_to do |format|
      if @chuangyexingdong.update_attributes(params[:chuangyexingdong])
        format.html { redirect_to(@chuangyexingdong, :notice => 'Chuangyexingdong was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chuangyexingdong.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chuangyexingdongs/1
  # DELETE /chuangyexingdongs/1.xml
  def destroy
    @chuangyexingdong = Chuangyexingdong.find(params[:id])
    @chuangyexingdong.destroy

    respond_to do |format|
      format.html { redirect_to(chuangyexingdongs_url) }
      format.xml  { head :ok }
    end
  end
end
