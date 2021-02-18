require 'test_helper'

class Blog::ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_list = blog_lists(:one)
  end

  test "should get index" do
    get blog_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_list_url
    assert_response :success
  end

  test "should create blog_list" do
    assert_difference('Blog::List.count') do
      post blog_lists_url, params: { blog_list: { name: @blog_list.name, position: @blog_list.position } }
    end

    assert_redirected_to blog_list_url(Blog::List.last)
  end

  test "should show blog_list" do
    get blog_list_url(@blog_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_list_url(@blog_list)
    assert_response :success
  end

  test "should update blog_list" do
    patch blog_list_url(@blog_list), params: { blog_list: { name: @blog_list.name, position: @blog_list.position } }
    assert_redirected_to blog_list_url(@blog_list)
  end

  test "should destroy blog_list" do
    assert_difference('Blog::List.count', -1) do
      delete blog_list_url(@blog_list)
    end

    assert_redirected_to blog_lists_url
  end
end
