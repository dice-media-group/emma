require "application_system_test_case"

class Blog::RecommendationsTest < ApplicationSystemTestCase
  setup do
    @blog_recommendation = blog_recommendations(:one)
  end

  test "visiting the index" do
    visit blog_recommendations_url
    assert_selector "h1", text: "Blog/Recommendations"
  end

  test "creating a Recommendation" do
    visit blog_recommendations_url
    click_on "New Blog/Recommendation"

    fill_in "Description", with: @blog_recommendation.description
    fill_in "Entry", with: @blog_recommendation.entry_id
    click_on "Create Recommendation"

    assert_text "Recommendation was successfully created"
    click_on "Back"
  end

  test "updating a Recommendation" do
    visit blog_recommendations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @blog_recommendation.description
    fill_in "Entry", with: @blog_recommendation.entry_id
    click_on "Update Recommendation"

    assert_text "Recommendation was successfully updated"
    click_on "Back"
  end

  test "destroying a Recommendation" do
    visit blog_recommendations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recommendation was successfully destroyed"
  end
end
