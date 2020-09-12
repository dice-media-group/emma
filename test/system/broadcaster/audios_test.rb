require "application_system_test_case"

class Broadcaster::AudiosTest < ApplicationSystemTestCase
  setup do
    @broadcaster_audio = broadcaster_audios(:one)
  end

  test "visiting the index" do
    visit broadcaster_audios_url
    assert_selector "h1", text: "Broadcaster/Audios"
  end

  test "creating a Audio" do
    visit broadcaster_audios_url
    click_on "New Broadcaster/Audio"

    fill_in "Broadcaster theme", with: @broadcaster_audio.broadcaster_theme_id
    fill_in "Title", with: @broadcaster_audio.title
    click_on "Create Audio"

    assert_text "Audio was successfully created"
    click_on "Back"
  end

  test "updating a Audio" do
    visit broadcaster_audios_url
    click_on "Edit", match: :first

    fill_in "Broadcaster theme", with: @broadcaster_audio.broadcaster_theme_id
    fill_in "Title", with: @broadcaster_audio.title
    click_on "Update Audio"

    assert_text "Audio was successfully updated"
    click_on "Back"
  end

  test "destroying a Audio" do
    visit broadcaster_audios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Audio was successfully destroyed"
  end
end
