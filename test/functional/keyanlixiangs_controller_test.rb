require 'test_helper'

class KeyanlixiangsControllerTest < ActionController::TestCase
  setup do
    @keyanlixiang = keyanlixiangs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:keyanlixiangs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create keyanlixiang" do
    assert_difference('Keyanlixiang.count') do
      post :create, :keyanlixiang => @keyanlixiang.attributes
    end

    assert_redirected_to keyanlixiang_path(assigns(:keyanlixiang))
  end

  test "should show keyanlixiang" do
    get :show, :id => @keyanlixiang.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @keyanlixiang.to_param
    assert_response :success
  end

  test "should update keyanlixiang" do
    put :update, :id => @keyanlixiang.to_param, :keyanlixiang => @keyanlixiang.attributes
    assert_redirected_to keyanlixiang_path(assigns(:keyanlixiang))
  end

  test "should destroy keyanlixiang" do
    assert_difference('Keyanlixiang.count', -1) do
      delete :destroy, :id => @keyanlixiang.to_param
    end

    assert_redirected_to keyanlixiangs_path
  end
end
