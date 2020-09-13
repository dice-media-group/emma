require 'test_helper'

class Broadcaster::AudiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broadcaster_audio = broadcaster_audios(:one)
  end

  test "should get index" do
    get broadcaster_audios_url
    assert_response :success
  end

  test "should get new" do
    get new_broadcaster_audio_url
    assert_response :success
  end

  test "should create broadcaster_audio" do
    assert_difference('Broadcaster::Audio.count') do
      post broadcaster_audios_url, params: { broadcaster_audio: { broadcaster_theme_id: @broadcaster_audio.broadcaster_theme_id, title: @broadcaster_audio.title } }
    end

    assert_redirected_to broadcaster_audio_url(Broadcaster::Audio.last)
  end

  test "should show broadcaster_audio" do
    get broadcaster_audio_url(@broadcaster_audio)
    assert_response :success
  end

  test "should get edit" do
    get edit_broadcaster_audio_url(@broadcaster_audio)
    assert_response :success
  end

  test "should update broadcaster_audio" do
    patch broadcaster_audio_url(@broadcaster_audio), params: { broadcaster_audio: { broadcaster_theme_id: @broadcaster_audio.broadcaster_theme_id, title: @broadcaster_audio.title } }
    assert_redirected_to broadcaster_audio_url(@broadcaster_audio)
  end

  test "should destroy broadcaster_audio" do
    assert_difference('Broadcaster::Audio.count', -1) do
      delete broadcaster_audio_url(@broadcaster_audio)
    end

    assert_redirected_to broadcaster_audios_url
  end
end
