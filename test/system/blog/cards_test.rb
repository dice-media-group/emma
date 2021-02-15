require "application_system_test_case"

class Blog::CardsTest < ApplicationSystemTestCase
  setup do
    @blog_card = blog_cards(:one)
  end

  test "visiting the index" do
    visit blog_cards_url
    assert_selector "h1", text: "Blog/Cards"
  end

  test "creating a Card" do
    visit blog_cards_url
    click_on "New Blog/Card"

    fill_in "Blog list", with: @blog_card.blog_list_id
    fill_in "Name", with: @blog_card.name
    fill_in "Position", with: @blog_card.position
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit blog_cards_url
    click_on "Edit", match: :first

    fill_in "Blog list", with: @blog_card.blog_list_id
    fill_in "Name", with: @blog_card.name
    fill_in "Position", with: @blog_card.position
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit blog_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
