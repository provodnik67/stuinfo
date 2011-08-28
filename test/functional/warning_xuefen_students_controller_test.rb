require 'test_helper'

class WarningXuefenStudentsControllerTest < ActionController::TestCase
  setup do
    @warning_xuefen_student = warning_xuefen_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warning_xuefen_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warning_xuefen_student" do
    assert_difference('WarningXuefenStudent.count') do
      post :create, :warning_xuefen_student => @warning_xuefen_student.attributes
    end

    assert_redirected_to warning_xuefen_student_path(assigns(:warning_xuefen_student))
  end

  test "should show warning_xuefen_student" do
    get :show, :id => @warning_xuefen_student.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warning_xuefen_student.to_param
    assert_response :success
  end

  test "should update warning_xuefen_student" do
    put :update, :id => @warning_xuefen_student.to_param, :warning_xuefen_student => @warning_xuefen_student.attributes
    assert_redirected_to warning_xuefen_student_path(assigns(:warning_xuefen_student))
  end

  test "should destroy warning_xuefen_student" do
    assert_difference('WarningXuefenStudent.count', -1) do
      delete :destroy, :id => @warning_xuefen_student.to_param
    end

    assert_redirected_to warning_xuefen_students_path
  end
end
