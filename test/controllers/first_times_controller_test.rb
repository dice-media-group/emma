require 'test_helper'

class FirstTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_time = first_times(:one)
  end

  test "should get index" do
    get first_times_url
    assert_response :success
  end

  test "should get new" do
    get new_first_time_url
    assert_response :success
  end

  test "should create first_time" do
    assert_difference('FirstTime.count') do
      post first_times_url, params: { first_time: { blurb: @first_time.blurb, featured_image_src: @first_time.featured_image_src, featured_youtube_video_url: @first_time.featured_youtube_video_url, first_name: @first_time.first_name, last_name: @first_time.last_name, twitter_handle: @first_time.twitter_handle } }
    end

    assert_redirected_to first_time_url(FirstTime.last)
  end

  test "should show first_time" do
    get first_time_url(@first_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_first_time_url(@first_time)
    assert_response :success
  end

  test "should update first_time" do
    patch first_time_url(@first_time), params: { first_time: { blurb: @first_time.blurb, featured_image_src: @first_time.featured_image_src, featured_youtube_video_url: @first_time.featured_youtube_video_url, first_name: @first_time.first_name, last_name: @first_time.last_name, twitter_handle: @first_time.twitter_handle } }
    assert_redirected_to first_time_url(@first_time)
  end

  test "should destroy first_time" do
    assert_difference('FirstTime.count', -1) do
      delete first_time_url(@first_time)
    end

    assert_redirected_to first_times_url
  end
end
