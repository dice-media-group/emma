require 'test_helper'

class Blog::RecommendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_recommendation = blog_recommendations(:one)
  end

  test "should get index" do
    get blog_recommendations_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_recommendation_url
    assert_response :success
  end

  test "should create blog_recommendation" do
    assert_difference('Blog::Recommendation.count') do
      post blog_recommendations_url, params: { blog_recommendation: { description: @blog_recommendation.description, entry_id: @blog_recommendation.entry_id } }
    end

    assert_redirected_to blog_recommendation_url(Blog::Recommendation.last)
  end

  test "should show blog_recommendation" do
    get blog_recommendation_url(@blog_recommendation)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_recommendation_url(@blog_recommendation)
    assert_response :success
  end

  test "should update blog_recommendation" do
    patch blog_recommendation_url(@blog_recommendation), params: { blog_recommendation: { description: @blog_recommendation.description, entry_id: @blog_recommendation.entry_id } }
    assert_redirected_to blog_recommendation_url(@blog_recommendation)
  end

  test "should destroy blog_recommendation" do
    assert_difference('Blog::Recommendation.count', -1) do
      delete blog_recommendation_url(@blog_recommendation)
    end

    assert_redirected_to blog_recommendations_url
  end
end
