require "application_system_test_case"

class MediaAppearancesTest < ApplicationSystemTestCase
  setup do
    @media_appearance = media_appearances(:one)
  end

  test "visiting the index" do
    visit media_appearances_url
    assert_selector "h1", text: "Media Appearances"
  end

  test "creating a Media appearance" do
    visit media_appearances_url
    click_on "New Media Appearance"

    fill_in "Published on", with: @media_appearance.published_on
    fill_in "Title", with: @media_appearance.title
    click_on "Create Media appearance"

    assert_text "Media appearance was successfully created"
    click_on "Back"
  end

  test "updating a Media appearance" do
    visit media_appearances_url
    click_on "Edit", match: :first

    fill_in "Published on", with: @media_appearance.published_on
    fill_in "Title", with: @media_appearance.title
    click_on "Update Media appearance"

    assert_text "Media appearance was successfully updated"
    click_on "Back"
  end

  test "destroying a Media appearance" do
    visit media_appearances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Media appearance was successfully destroyed"
  end
end
