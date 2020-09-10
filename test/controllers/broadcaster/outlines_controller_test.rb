require 'test_helper'

class Broadcaster::OutlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_outline = broadcaster_outlines(:one)
  end

  test "should get index" do
    get broadcaster_outlines_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_outline_url
    assert_response :success
  end

  test "should create broadcaster_outline" do
    assert_difference('Broadcaster::Outline.count') do
      post broadcaster_outlines_url, params: { broadcaster_outline: { body: @broadcaster_outline.body } }
    end

    assert_redirected_to broadcaster_outline_url(Broadcaster::Outline.last)
  end

  test "should show broadcaster_outline" do
    get broadcaster_outline_url(@broadcaster_outline)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_outline_url(@broadcaster_outline)
    assert_response :success
  end

  test "should update broadcaster_outline" do
    patch broadcaster_outline_url(@broadcaster_outline), params: { broadcaster_outline: { body: @broadcaster_outline.body } }
    assert_redirected_to broadcaster_outline_url(@broadcaster_outline)
  end

  test "should destroy broadcaster_outline" do
    assert_difference('Broadcaster::Outline.count', -1) do
      delete broadcaster_outline_url(@broadcaster_outline)
    end

    assert_redirected_to broadcaster_outlines_url
  end
end
