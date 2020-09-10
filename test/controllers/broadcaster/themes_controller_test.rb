require 'test_helper'

class Broadcaster::ThemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_theme = broadcaster_themes(:one)
  end

  test "should get index" do
    get broadcaster_themes_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_theme_url
    assert_response :success
  end

  test "should create broadcaster_theme" do
    assert_difference('Broadcaster::Theme.count') do
      post broadcaster_themes_url, params: { broadcaster_theme: { title: @broadcaster_theme.title } }
    end

    assert_redirected_to broadcaster_theme_url(Broadcaster::Theme.last)
  end

  test "should show broadcaster_theme" do
    get broadcaster_theme_url(@broadcaster_theme)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_theme_url(@broadcaster_theme)
    assert_response :success
  end

  test "should update broadcaster_theme" do
    patch broadcaster_theme_url(@broadcaster_theme), params: { broadcaster_theme: { title: @broadcaster_theme.title } }
    assert_redirected_to broadcaster_theme_url(@broadcaster_theme)
  end

  test "should destroy broadcaster_theme" do
    assert_difference('Broadcaster::Theme.count', -1) do
      delete broadcaster_theme_url(@broadcaster_theme)
    end

    assert_redirected_to broadcaster_themes_url
  end
end
