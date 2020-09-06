require 'test_helper'

class MediaAppearancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_appearance = media_appearances(:one)
  end

  test "should get index" do
    get media_appearances_url
    assert_response :success
  end

  test "should get new" do
    get new_media_appearance_url
    assert_response :success
  end

  test "should create media_appearance" do
    assert_difference('MediaAppearance.count') do
      post media_appearances_url, params: { media_appearance: { published_on: @media_appearance.published_on, title: @media_appearance.title } }
    end

    assert_redirected_to media_appearance_url(MediaAppearance.last)
  end

  test "should show media_appearance" do
    get media_appearance_url(@media_appearance)
    assert_response :success
  end

  test "should get edit" do
    get edit_media_appearance_url(@media_appearance)
    assert_response :success
  end

  test "should update media_appearance" do
    patch media_appearance_url(@media_appearance), params: { media_appearance: { published_on: @media_appearance.published_on, title: @media_appearance.title } }
    assert_redirected_to media_appearance_url(@media_appearance)
  end

  test "should destroy media_appearance" do
    assert_difference('MediaAppearance.count', -1) do
      delete media_appearance_url(@media_appearance)
    end

    assert_redirected_to media_appearances_url
  end
end
