require "application_system_test_case"

class Blog::ArticlesTest < ApplicationSystemTestCase
  setup do
    @blog_article = blog_articles(:one)
  end

  test "visiting the index" do
    visit blog_articles_url
    assert_selector "h1", text: "Blog/Articles"
  end

  test "creating a Article" do
    visit blog_articles_url
    click_on "New Blog/Article"

    fill_in "Body", with: @blog_article.body
    fill_in "Title", with: @blog_article.title
    fill_in "User", with: @blog_article.user_id
    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "updating a Article" do
    visit blog_articles_url
    click_on "Edit", match: :first

    fill_in "Body", with: @blog_article.body
    fill_in "Title", with: @blog_article.title
    fill_in "User", with: @blog_article.user_id
    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "destroying a Article" do
    visit blog_articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article was successfully destroyed"
  end
end
