require 'test_helper'

class WarningChengjiStudentsControllerTest < ActionController::TestCase
  setup do
    @warning_chengji_student = warning_chengji_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warning_chengji_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warning_chengji_student" do
    assert_difference('WarningChengjiStudent.count') do
      post :create, :warning_chengji_student => @warning_chengji_student.attributes
    end

    assert_redirected_to warning_chengji_student_path(assigns(:warning_chengji_student))
  end

  test "should show warning_chengji_student" do
    get :show, :id => @warning_chengji_student.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warning_chengji_student.to_param
    assert_response :success
  end

  test "should update warning_chengji_student" do
    put :update, :id => @warning_chengji_student.to_param, :warning_chengji_student => @warning_chengji_student.attributes
    assert_redirected_to warning_chengji_student_path(assigns(:warning_chengji_student))
  end

  test "should destroy warning_chengji_student" do
    assert_difference('WarningChengjiStudent.count', -1) do
      delete :destroy, :id => @warning_chengji_student.to_param
    end

    assert_redirected_to warning_chengji_students_path
  end
end
