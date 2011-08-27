# -*- encoding : utf-8 -*-
require 'test_helper'

class GraduateInfoItemsControllerTest < ActionController::TestCase
  setup do
    @graduate_info_item = graduate_info_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graduate_info_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graduate_info_item" do
    assert_difference('GraduateInfoItem.count') do
      post :create, :graduate_info_item => @graduate_info_item.attributes
    end

    assert_redirected_to graduate_info_item_path(assigns(:graduate_info_item))
  end

  test "should show graduate_info_item" do
    get :show, :id => @graduate_info_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @graduate_info_item.to_param
    assert_response :success
  end

  test "should update graduate_info_item" do
    put :update, :id => @graduate_info_item.to_param, :graduate_info_item => @graduate_info_item.attributes
    assert_redirected_to graduate_info_item_path(assigns(:graduate_info_item))
  end

  test "should destroy graduate_info_item" do
    assert_difference('GraduateInfoItem.count', -1) do
      delete :destroy, :id => @graduate_info_item.to_param
    end

    assert_redirected_to graduate_info_items_path
  end
end
