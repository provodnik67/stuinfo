require 'test_helper'

class Import6LogsControllerTest < ActionController::TestCase
  setup do
    @import6_log = import6_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:import6_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import6_log" do
    assert_difference('Import6Log.count') do
      post :create, :import6_log => @import6_log.attributes
    end

    assert_redirected_to import6_log_path(assigns(:import6_log))
  end

  test "should show import6_log" do
    get :show, :id => @import6_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @import6_log.to_param
    assert_response :success
  end

  test "should update import6_log" do
    put :update, :id => @import6_log.to_param, :import6_log => @import6_log.attributes
    assert_redirected_to import6_log_path(assigns(:import6_log))
  end

  test "should destroy import6_log" do
    assert_difference('Import6Log.count', -1) do
      delete :destroy, :id => @import6_log.to_param
    end

    assert_redirected_to import6_logs_path
  end
end
