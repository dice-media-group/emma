require 'test_helper'

class PressKitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @press_kit = press_kits(:one)
  end

  test "should get index" do
    get press_kits_url
    assert_response :success
  end

  test "should get new" do
    get new_press_kit_url
    assert_response :success
  end

  test "should create press_kit" do
    assert_difference('PressKit.count') do
      post press_kits_url, params: { press_kit: {  } }
    end

    assert_redirected_to press_kit_url(PressKit.last)
  end

  test "should show press_kit" do
    get press_kit_url(@press_kit)
    assert_response :success
  end

  test "should get edit" do
    get edit_press_kit_url(@press_kit)
    assert_response :success
  end

  test "should update press_kit" do
    patch press_kit_url(@press_kit), params: { press_kit: {  } }
    assert_redirected_to press_kit_url(@press_kit)
  end

  test "should destroy press_kit" do
    assert_difference('PressKit.count', -1) do
      delete press_kit_url(@press_kit)
    end

    assert_redirected_to press_kits_url
  end
end
