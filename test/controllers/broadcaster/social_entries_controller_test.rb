require 'test_helper'

class Broadcaster::SocialEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_social_entry = broadcaster_social_entries(:one)
  end

  test "should get index" do
    get broadcaster_social_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_social_entry_url
    assert_response :success
  end

  test "should create broadcaster_social_entry" do
    assert_difference('Broadcaster::SocialEntry.count') do
      post broadcaster_social_entries_url, params: { broadcaster_social_entry: { broadcaster_theme_id: @broadcaster_social_entry.broadcaster_theme_id, title: @broadcaster_social_entry.title } }
    end

    assert_redirected_to broadcaster_social_entry_url(Broadcaster::SocialEntry.last)
  end

  test "should show broadcaster_social_entry" do
    get broadcaster_social_entry_url(@broadcaster_social_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_social_entry_url(@broadcaster_social_entry)
    assert_response :success
  end

  test "should update broadcaster_social_entry" do
    patch broadcaster_social_entry_url(@broadcaster_social_entry), params: { broadcaster_social_entry: { broadcaster_theme_id: @broadcaster_social_entry.broadcaster_theme_id, title: @broadcaster_social_entry.title } }
    assert_redirected_to broadcaster_social_entry_url(@broadcaster_social_entry)
  end

  test "should destroy broadcaster_social_entry" do
    assert_difference('Broadcaster::SocialEntry.count', -1) do
      delete broadcaster_social_entry_url(@broadcaster_social_entry)
    end

    assert_redirected_to broadcaster_social_entries_url
  end
end
