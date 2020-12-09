require "application_system_test_case"

class BiographiesTest < ApplicationSystemTestCase
  setup do
    @biography = biographies(:one)
  end

  test "visiting the index" do
    visit biographies_url
    assert_selector "h1", text: "Biographies"
  end

  test "creating a Biography" do
    visit biographies_url
    click_on "New Biography"

    fill_in "Title", with: @biography.title
    click_on "Create Biography"

    assert_text "Biography was successfully created"
    click_on "Back"
  end

  test "updating a Biography" do
    visit biographies_url
    click_on "Edit", match: :first

    fill_in "Title", with: @biography.title
    click_on "Update Biography"

    assert_text "Biography was successfully updated"
    click_on "Back"
  end

  test "destroying a Biography" do
    visit biographies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Biography was successfully destroyed"
  end
end
