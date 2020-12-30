require 'test_helper'

class HomeInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_info = home_infos(:one)
  end

  test "should get index" do
    get home_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_home_info_url
    assert_response :success
  end

  test "should create home_info" do
    assert_difference('HomeInfo.count') do
      post home_infos_url, params: { home_info: { biography_blurb: @home_info.biography_blurb, site_id: @home_info.site_id, video_billboard_url: @home_info.video_billboard_url, watch_this_video_url: @home_info.watch_this_video_url } }
    end

    assert_redirected_to home_info_url(HomeInfo.last)
  end

  test "should show home_info" do
    get home_info_url(@home_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_info_url(@home_info)
    assert_response :success
  end

  test "should update home_info" do
    patch home_info_url(@home_info), params: { home_info: { biography_blurb: @home_info.biography_blurb, site_id: @home_info.site_id, video_billboard_url: @home_info.video_billboard_url, watch_this_video_url: @home_info.watch_this_video_url } }
    assert_redirected_to home_info_url(@home_info)
  end

  test "should destroy home_info" do
    assert_difference('HomeInfo.count', -1) do
      delete home_info_url(@home_info)
    end

    assert_redirected_to home_infos_url
  end
end
