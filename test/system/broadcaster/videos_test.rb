require "application_system_test_case"

class Broadcaster::VideosTest < ApplicationSystemTestCase
  setup do
    @broadcaster_video = broadcaster_videos(:one)
  end

  test "visiting the index" do
    visit broadcaster_videos_url
    assert_selector "h1", text: "Broadcaster/Videos"
  end

  test "creating a Video" do
    visit broadcaster_videos_url
    click_on "New Broadcaster/Video"

    fill_in "Title", with: @broadcaster_video.title
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "updating a Video" do
    visit broadcaster_videos_url
    click_on "Edit", match: :first

    fill_in "Title", with: @broadcaster_video.title
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "destroying a Video" do
    visit broadcaster_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Video was successfully destroyed"
  end
end
