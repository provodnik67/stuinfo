class WarningXuefenStudentsController < ApplicationController
  # GET /warning_xuefen_students
  # GET /warning_xuefen_students.xml
  def index
    @warning_xuefen_students = WarningXuefenStudent.order('val').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warning_xuefen_students }
    end
  end

  # GET /warning_xuefen_students/1
  # GET /warning_xuefen_students/1.xml
  def show
    @warning_xuefen_student = WarningXuefenStudent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warning_xuefen_student }
    end
  end

  # GET /warning_xuefen_students/new
  # GET /warning_xuefen_students/new.xml
  def new
    @warning_xuefen_student = WarningXuefenStudent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warning_xuefen_student }
    end
  end

  # GET /warning_xuefen_students/1/edit
  def edit
    @warning_xuefen_student = WarningXuefenStudent.find(params[:id])
  end

  # POST /warning_xuefen_students
  # POST /warning_xuefen_students.xml
  def create
    @warning_xuefen_student = WarningXuefenStudent.new(params[:warning_xuefen_student])

    respond_to do |format|
      if @warning_xuefen_student.save
        format.html { redirect_to(@warning_xuefen_student, :notice => 'Warning xuefen student was successfully created.') }
        format.xml  { render :xml => @warning_xuefen_student, :status => :created, :location => @warning_xuefen_student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warning_xuefen_student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warning_xuefen_students/1
  # PUT /warning_xuefen_students/1.xml
  def update
    @warning_xuefen_student = WarningXuefenStudent.find(params[:id])

    respond_to do |format|
      if @warning_xuefen_student.update_attributes(params[:warning_xuefen_student])
        format.html { redirect_to(@warning_xuefen_student, :notice => 'Warning xuefen student was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warning_xuefen_student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warning_xuefen_students/1
  # DELETE /warning_xuefen_students/1.xml
  def destroy
    @warning_xuefen_student = WarningXuefenStudent.find(params[:id])
    @warning_xuefen_student.destroy

    respond_to do |format|
      format.html { redirect_to(warning_xuefen_students_url) }
      format.js { 
        render text:'$("#tr_'+params[:id]+'").hide("fade")'
      }
      format.xml  { head :ok }
    end
  end
end
