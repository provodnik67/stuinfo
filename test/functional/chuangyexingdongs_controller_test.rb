require 'test_helper'

class ChuangyexingdongsControllerTest < ActionController::TestCase
  setup do
    @chuangyexingdong = chuangyexingdongs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chuangyexingdongs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chuangyexingdong" do
    assert_difference('Chuangyexingdong.count') do
      post :create, :chuangyexingdong => @chuangyexingdong.attributes
    end

    assert_redirected_to chuangyexingdong_path(assigns(:chuangyexingdong))
  end

  test "should show chuangyexingdong" do
    get :show, :id => @chuangyexingdong.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chuangyexingdong.to_param
    assert_response :success
  end

  test "should update chuangyexingdong" do
    put :update, :id => @chuangyexingdong.to_param, :chuangyexingdong => @chuangyexingdong.attributes
    assert_redirected_to chuangyexingdong_path(assigns(:chuangyexingdong))
  end

  test "should destroy chuangyexingdong" do
    assert_difference('Chuangyexingdong.count', -1) do
      delete :destroy, :id => @chuangyexingdong.to_param
    end

    assert_redirected_to chuangyexingdongs_path
  end
end
