require "application_system_test_case"

class HomeInfosTest < ApplicationSystemTestCase
  setup do
    @home_info = home_infos(:one)
  end

  test "visiting the index" do
    visit home_infos_url
    assert_selector "h1", text: "Home Infos"
  end

  test "creating a Home info" do
    visit home_infos_url
    click_on "New Home Info"

    fill_in "Biography blurb", with: @home_info.biography_blurb
    fill_in "Site", with: @home_info.site_id
    fill_in "Video billboard url", with: @home_info.video_billboard_url
    fill_in "Watch this video url", with: @home_info.watch_this_video_url
    click_on "Create Home info"

    assert_text "Home info was successfully created"
    click_on "Back"
  end

  test "updating a Home info" do
    visit home_infos_url
    click_on "Edit", match: :first

    fill_in "Biography blurb", with: @home_info.biography_blurb
    fill_in "Site", with: @home_info.site_id
    fill_in "Video billboard url", with: @home_info.video_billboard_url
    fill_in "Watch this video url", with: @home_info.watch_this_video_url
    click_on "Update Home info"

    assert_text "Home info was successfully updated"
    click_on "Back"
  end

  test "destroying a Home info" do
    visit home_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home info was successfully destroyed"
  end
end
