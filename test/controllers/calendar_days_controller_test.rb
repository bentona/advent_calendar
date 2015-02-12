require 'test_helper'

class CalendarDaysControllerTest < ActionController::TestCase
  setup do
    @calendar_day = calendar_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_day" do
    assert_difference('CalendarDay.count') do
      post :create, calendar_day: { description: @calendar_day.description, image_path: @calendar_day.image_path, starts: @calendar_day.starts }
    end

    assert_redirected_to calendar_day_path(assigns(:calendar_day))
  end

  test "should show calendar_day" do
    get :show, id: @calendar_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_day
    assert_response :success
  end

  test "should update calendar_day" do
    patch :update, id: @calendar_day, calendar_day: { description: @calendar_day.description, image_path: @calendar_day.image_path, starts: @calendar_day.starts }
    assert_redirected_to calendar_day_path(assigns(:calendar_day))
  end

  test "should destroy calendar_day" do
    assert_difference('CalendarDay.count', -1) do
      delete :destroy, id: @calendar_day
    end

    assert_redirected_to calendar_days_path
  end
end
