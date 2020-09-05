require 'test_helper'

class Blog::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_article = blog_articles(:one)
  end

  test "should get index" do
    get blog_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_article_url
    assert_response :success
  end

  test "should create blog_article" do
    assert_difference('Blog::Article.count') do
      post blog_articles_url, params: { blog_article: { body: @blog_article.body, title: @blog_article.title, user_id: @blog_article.user_id } }
    end

    assert_redirected_to blog_article_url(Blog::Article.last)
  end

  test "should show blog_article" do
    get blog_article_url(@blog_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_article_url(@blog_article)
    assert_response :success
  end

  test "should update blog_article" do
    patch blog_article_url(@blog_article), params: { blog_article: { body: @blog_article.body, title: @blog_article.title, user_id: @blog_article.user_id } }
    assert_redirected_to blog_article_url(@blog_article)
  end

  test "should destroy blog_article" do
    assert_difference('Blog::Article.count', -1) do
      delete blog_article_url(@blog_article)
    end

    assert_redirected_to blog_articles_url
  end
end
