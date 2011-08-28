require 'test_helper'

class WarningEventsControllerTest < ActionController::TestCase
  setup do
    @warning_event = warning_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warning_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warning_event" do
    assert_difference('WarningEvent.count') do
      post :create, :warning_event => @warning_event.attributes
    end

    assert_redirected_to warning_event_path(assigns(:warning_event))
  end

  test "should show warning_event" do
    get :show, :id => @warning_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warning_event.to_param
    assert_response :success
  end

  test "should update warning_event" do
    put :update, :id => @warning_event.to_param, :warning_event => @warning_event.attributes
    assert_redirected_to warning_event_path(assigns(:warning_event))
  end

  test "should destroy warning_event" do
    assert_difference('WarningEvent.count', -1) do
      delete :destroy, :id => @warning_event.to_param
    end

    assert_redirected_to warning_events_path
  end
end
