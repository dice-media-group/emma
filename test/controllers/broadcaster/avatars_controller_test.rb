require 'test_helper'

class Broadcaster::AvatarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_avatar = broadcaster_avatars(:one)
  end

  test "should get index" do
    get broadcaster_avatars_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_avatar_url
    assert_response :success
  end

  test "should create broadcaster_avatar" do
    assert_difference('Broadcaster::Avatar.count') do
      post broadcaster_avatars_url, params: { broadcaster_avatar: { description: @broadcaster_avatar.description, name: @broadcaster_avatar.name } }
    end

    assert_redirected_to broadcaster_avatar_url(Broadcaster::Avatar.last)
  end

  test "should show broadcaster_avatar" do
    get broadcaster_avatar_url(@broadcaster_avatar)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_avatar_url(@broadcaster_avatar)
    assert_response :success
  end

  test "should update broadcaster_avatar" do
    patch broadcaster_avatar_url(@broadcaster_avatar), params: { broadcaster_avatar: { description: @broadcaster_avatar.description, name: @broadcaster_avatar.name } }
    assert_redirected_to broadcaster_avatar_url(@broadcaster_avatar)
  end

  test "should destroy broadcaster_avatar" do
    assert_difference('Broadcaster::Avatar.count', -1) do
      delete broadcaster_avatar_url(@broadcaster_avatar)
    end

    assert_redirected_to broadcaster_avatars_url
  end
end
