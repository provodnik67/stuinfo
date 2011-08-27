require 'test_helper'

class Import5LogsControllerTest < ActionController::TestCase
  setup do
    @import5_log = import5_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import5_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import5_log" do
    assert_difference('Import5Log.count') do
      post :create, :import5_log => @import5_log.attributes
    end

    assert_redirected_to import5_log_path(assigns(:import5_log))
  end

  test "should show import5_log" do
    get :show, :id => @import5_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @import5_log.to_param
    assert_response :success
  end

  test "should update import5_log" do
    put :update, :id => @import5_log.to_param, :import5_log => @import5_log.attributes
    assert_redirected_to import5_log_path(assigns(:import5_log))
  end

  test "should destroy import5_log" do
    assert_difference('Import5Log.count', -1) do
      delete :destroy, :id => @import5_log.to_param
    end

    assert_redirected_to import5_logs_path
  end
end
