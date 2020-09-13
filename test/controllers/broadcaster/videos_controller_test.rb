require 'test_helper'

class Broadcaster::VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_video = broadcaster_videos(:one)
  end

  test "should get index" do
    get broadcaster_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_video_url
    assert_response :success
  end

  test "should create broadcaster_video" do
    assert_difference('Broadcaster::Video.count') do
      post broadcaster_videos_url, params: { broadcaster_video: { title: @broadcaster_video.title } }
    end

    assert_redirected_to broadcaster_video_url(Broadcaster::Video.last)
  end

  test "should show broadcaster_video" do
    get broadcaster_video_url(@broadcaster_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_video_url(@broadcaster_video)
    assert_response :success
  end

  test "should update broadcaster_video" do
    patch broadcaster_video_url(@broadcaster_video), params: { broadcaster_video: { title: @broadcaster_video.title } }
    assert_redirected_to broadcaster_video_url(@broadcaster_video)
  end

  test "should destroy broadcaster_video" do
    assert_difference('Broadcaster::Video.count', -1) do
      delete broadcaster_video_url(@broadcaster_video)
    end

    assert_redirected_to broadcaster_videos_url
  end
end
