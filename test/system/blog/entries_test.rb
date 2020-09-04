require "application_system_test_case"

class Blog::EntriesTest < ApplicationSystemTestCase
  setup do
    @blog_entry = blog_entries(:one)
  end

  test "visiting the index" do
    visit blog_entries_url
    assert_selector "h1", text: "Blog/Entries"
  end

  test "creating a Entry" do
    visit blog_entries_url
    click_on "New Blog/Entry"

    fill_in "Title", with: @blog_entry.title
    click_on "Create Entry"

    assert_text "Entry was successfully created"
    click_on "Back"
  end

  test "updating a Entry" do
    visit blog_entries_url
    click_on "Edit", match: :first

    fill_in "Title", with: @blog_entry.title
    click_on "Update Entry"

    assert_text "Entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Entry" do
    visit blog_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entry was successfully destroyed"
  end
end
