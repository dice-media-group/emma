require "application_system_test_case"

class Broadcaster::OutlinesTest < ApplicationSystemTestCase
  setup do
    @broadcaster_outline = broadcaster_outlines(:one)
  end

  test "visiting the index" do
    visit broadcaster_outlines_url
    assert_selector "h1", text: "Broadcaster/Outlines"
  end

  test "creating a Outline" do
    visit broadcaster_outlines_url
    click_on "New Broadcaster/Outline"

    fill_in "Body", with: @broadcaster_outline.body
    click_on "Create Outline"

    assert_text "Outline was successfully created"
    click_on "Back"
  end

  test "updating a Outline" do
    visit broadcaster_outlines_url
    click_on "Edit", match: :first

    fill_in "Body", with: @broadcaster_outline.body
    click_on "Update Outline"

    assert_text "Outline was successfully updated"
    click_on "Back"
  end

  test "destroying a Outline" do
    visit broadcaster_outlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outline was successfully destroyed"
  end
end
