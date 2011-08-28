class WarningChengjiStudentsController < ApplicationController
  # GET /warning_chengji_students
  # GET /warning_chengji_students.xml
  def index
    @warning_chengji_students = WarningChengjiStudent.order('val DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warning_chengji_students }
    end
  end

  # GET /warning_chengji_students/1
  # GET /warning_chengji_students/1.xml
  def show
    @warning_chengji_student = WarningChengjiStudent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warning_chengji_student }
    end
  end

  # GET /warning_chengji_students/new
  # GET /warning_chengji_students/new.xml
  def new
    @warning_chengji_student = WarningChengjiStudent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warning_chengji_student }
    end
  end

  # GET /warning_chengji_students/1/edit
  def edit
    @warning_chengji_student = WarningChengjiStudent.find(params[:id])
  end

  # POST /warning_chengji_students
  # POST /warning_chengji_students.xml
  def create
    @warning_chengji_student = WarningChengjiStudent.new(params[:warning_chengji_student])

    respond_to do |format|
      if @warning_chengji_student.save
        format.html { redirect_to(@warning_chengji_student, :notice => 'Warning chengji student was successfully created.') }
        format.xml  { render :xml => @warning_chengji_student, :status => :created, :location => @warning_chengji_student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warning_chengji_student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warning_chengji_students/1
  # PUT /warning_chengji_students/1.xml
  def update
    @warning_chengji_student = WarningChengjiStudent.find(params[:id])

    respond_to do |format|
      if @warning_chengji_student.update_attributes(params[:warning_chengji_student])
        format.html { redirect_to(@warning_chengji_student, :notice => 'Warning chengji student was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warning_chengji_student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warning_chengji_students/1
  # DELETE /warning_chengji_students/1.xml
  def destroy
    @warning_chengji_student = WarningChengjiStudent.find(params[:id])
    @warning_chengji_student.destroy

    respond_to do |format|
      format.html { redirect_to(warning_chengji_students_url) }
            format.js { 
        render text:'$("#tr_'+params[:id]+'").hide("fade")'
      }
      format.xml  { head :ok }
    end
  end
end
