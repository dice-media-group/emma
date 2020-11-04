require "application_system_test_case"

class FirstTimesTest < ApplicationSystemTestCase
  setup do
    @first_time = first_times(:one)
  end

  test "visiting the index" do
    visit first_times_url
    assert_selector "h1", text: "First Times"
  end

  test "creating a First time" do
    visit first_times_url
    click_on "New First Time"

    fill_in "Blurb", with: @first_time.blurb
    fill_in "Featured image src", with: @first_time.featured_image_src
    fill_in "Featured youtube video url", with: @first_time.featured_youtube_video_url
    fill_in "First name", with: @first_time.first_name
    fill_in "Last name", with: @first_time.last_name
    fill_in "Twitter handle", with: @first_time.twitter_handle
    click_on "Create First time"

    assert_text "First time was successfully created"
    click_on "Back"
  end

  test "updating a First time" do
    visit first_times_url
    click_on "Edit", match: :first

    fill_in "Blurb", with: @first_time.blurb
    fill_in "Featured image src", with: @first_time.featured_image_src
    fill_in "Featured youtube video url", with: @first_time.featured_youtube_video_url
    fill_in "First name", with: @first_time.first_name
    fill_in "Last name", with: @first_time.last_name
    fill_in "Twitter handle", with: @first_time.twitter_handle
    click_on "Update First time"

    assert_text "First time was successfully updated"
    click_on "Back"
  end

  test "destroying a First time" do
    visit first_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "First time was successfully destroyed"
  end
end
