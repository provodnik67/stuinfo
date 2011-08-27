require 'test_helper'

class Import7LogsControllerTest < ActionController::TestCase
  setup do
    @import7_log = import7_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import7_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import7_log" do
    assert_difference('Import7Log.count') do
      post :create, :import7_log => @import7_log.attributes
    end

    assert_redirected_to import7_log_path(assigns(:import7_log))
  end

  test "should show import7_log" do
    get :show, :id => @import7_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @import7_log.to_param
    assert_response :success
  end

  test "should update import7_log" do
    put :update, :id => @import7_log.to_param, :import7_log => @import7_log.attributes
    assert_redirected_to import7_log_path(assigns(:import7_log))
  end

  test "should destroy import7_log" do
    assert_difference('Import7Log.count', -1) do
      delete :destroy, :id => @import7_log.to_param
    end

    assert_redirected_to import7_logs_path
  end
end
