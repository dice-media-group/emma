require "application_system_test_case"

class PressKitsTest < ApplicationSystemTestCase
  setup do
    @press_kit = press_kits(:one)
  end

  test "visiting the index" do
    visit press_kits_url
    assert_selector "h1", text: "Press Kits"
  end

  test "creating a Press kit" do
    visit press_kits_url
    click_on "New Press Kit"

    click_on "Create Press kit"

    assert_text "Press kit was successfully created"
    click_on "Back"
  end

  test "updating a Press kit" do
    visit press_kits_url
    click_on "Edit", match: :first

    click_on "Update Press kit"

    assert_text "Press kit was successfully updated"
    click_on "Back"
  end

  test "destroying a Press kit" do
    visit press_kits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Press kit was successfully destroyed"
  end
end
