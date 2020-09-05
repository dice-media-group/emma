require 'test_helper'

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meetup = meetups(:one)
  end

  test "should get index" do
    get meetups_url
    assert_response :success
  end

  test "should get new" do
    get new_meetup_url
    assert_response :success
  end

  test "should create meetup" do
    assert_difference('Meetup.count') do
      post meetups_url, params: { meetup: { end_date: @meetup.end_date, location: @meetup.location, more_info_url: @meetup.more_info_url, start_date: @meetup.start_date, title: @meetup.title } }
    end

    assert_redirected_to meetup_url(Meetup.last)
  end

  test "should show meetup" do
    get meetup_url(@meetup)
    assert_response :success
  end

  test "should get edit" do
    get edit_meetup_url(@meetup)
    assert_response :success
  end

  test "should update meetup" do
    patch meetup_url(@meetup), params: { meetup: { end_date: @meetup.end_date, location: @meetup.location, more_info_url: @meetup.more_info_url, start_date: @meetup.start_date, title: @meetup.title } }
    assert_redirected_to meetup_url(@meetup)
  end

  test "should destroy meetup" do
    assert_difference('Meetup.count', -1) do
      delete meetup_url(@meetup)
    end

    assert_redirected_to meetups_url
  end
end
