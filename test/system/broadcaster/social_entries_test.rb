require "application_system_test_case"

class Broadcaster::SocialEntriesTest < ApplicationSystemTestCase
  setup do
    @broadcaster_social_entry = broadcaster_social_entries(:one)
  end

  test "visiting the index" do
    visit broadcaster_social_entries_url
    assert_selector "h1", text: "Broadcaster/Social Entries"
  end

  test "creating a Social entry" do
    visit broadcaster_social_entries_url
    click_on "New Broadcaster/Social Entry"

    fill_in "Broadcaster theme", with: @broadcaster_social_entry.broadcaster_theme_id
    fill_in "Title", with: @broadcaster_social_entry.title
    click_on "Create Social entry"

    assert_text "Social entry was successfully created"
    click_on "Back"
  end

  test "updating a Social entry" do
    visit broadcaster_social_entries_url
    click_on "Edit", match: :first

    fill_in "Broadcaster theme", with: @broadcaster_social_entry.broadcaster_theme_id
    fill_in "Title", with: @broadcaster_social_entry.title
    click_on "Update Social entry"

    assert_text "Social entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Social entry" do
    visit broadcaster_social_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Social entry was successfully destroyed"
  end
end
