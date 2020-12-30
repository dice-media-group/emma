require "application_system_test_case"

class HireMesTest < ApplicationSystemTestCase
  setup do
    @hire_me = hire_mes(:one)
  end

  test "visiting the index" do
    visit hire_mes_url
    assert_selector "h1", text: "Hire Mes"
  end

  test "creating a Hire me" do
    visit hire_mes_url
    click_on "New Hire Me"

    fill_in "Billboard image filename", with: @hire_me.billboard_image_filename
    fill_in "Body", with: @hire_me.body
    fill_in "Headline", with: @hire_me.headline
    fill_in "Site", with: @hire_me.site_id
    click_on "Create Hire me"

    assert_text "Hire me was successfully created"
    click_on "Back"
  end

  test "updating a Hire me" do
    visit hire_mes_url
    click_on "Edit", match: :first

    fill_in "Billboard image filename", with: @hire_me.billboard_image_filename
    fill_in "Body", with: @hire_me.body
    fill_in "Headline", with: @hire_me.headline
    fill_in "Site", with: @hire_me.site_id
    click_on "Update Hire me"

    assert_text "Hire me was successfully updated"
    click_on "Back"
  end

  test "destroying a Hire me" do
    visit hire_mes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hire me was successfully destroyed"
  end
end
