require "test_helper"

class WheelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wheel = wheels(:one)
  end

  test "should get index" do
    get wheels_url
    assert_response :success
  end

  test "should get new" do
    get new_wheel_url
    assert_response :success
  end

  test "should create wheel" do
    assert_difference("Wheel.count") do
      post wheels_url, params: { wheel: { vehicle_id: @wheel.vehicle_id, wheel_size: @wheel.wheel_size } }
    end

    assert_redirected_to wheel_url(Wheel.last)
  end

  test "should show wheel" do
    get wheel_url(@wheel)
    assert_response :success
  end

  test "should get edit" do
    get edit_wheel_url(@wheel)
    assert_response :success
  end

  test "should update wheel" do
    patch wheel_url(@wheel), params: { wheel: { vehicle_id: @wheel.vehicle_id, wheel_size: @wheel.wheel_size } }
    assert_redirected_to wheel_url(@wheel)
  end

  test "should destroy wheel" do
    assert_difference("Wheel.count", -1) do
      delete wheel_url(@wheel)
    end

    assert_redirected_to wheels_url
  end
end
