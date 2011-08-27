require 'test_helper'

class KaifangjijinsControllerTest < ActionController::TestCase
  setup do
    @kaifangjijin = kaifangjijins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kaifangjijins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kaifangjijin" do
    assert_difference('Kaifangjijin.count') do
      post :create, :kaifangjijin => @kaifangjijin.attributes
    end

    assert_redirected_to kaifangjijin_path(assigns(:kaifangjijin))
  end

  test "should show kaifangjijin" do
    get :show, :id => @kaifangjijin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kaifangjijin.to_param
    assert_response :success
  end

  test "should update kaifangjijin" do
    put :update, :id => @kaifangjijin.to_param, :kaifangjijin => @kaifangjijin.attributes
    assert_redirected_to kaifangjijin_path(assigns(:kaifangjijin))
  end

  test "should destroy kaifangjijin" do
    assert_difference('Kaifangjijin.count', -1) do
      delete :destroy, :id => @kaifangjijin.to_param
    end

    assert_redirected_to kaifangjijins_path
  end
end
