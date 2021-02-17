require 'test_helper'

class Blog::CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_card = blog_cards(:one)
  end

  test "should get index" do
    get blog_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_card_url
    assert_response :success
  end

  test "should create blog_card" do
    assert_difference('Blog::Card.count') do
      post blog_cards_url, params: { blog_card: { blog_list_id: @blog_card.blog_list_id, name: @blog_card.name, position: @blog_card.position } }
    end

    assert_redirected_to blog_card_url(Blog::Card.last)
  end

  test "should show blog_card" do
    get blog_card_url(@blog_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_card_url(@blog_card)
    assert_response :success
  end

  test "should update blog_card" do
    patch blog_card_url(@blog_card), params: { blog_card: { blog_list_id: @blog_card.blog_list_id, name: @blog_card.name, position: @blog_card.position } }
    assert_redirected_to blog_card_url(@blog_card)
  end

  test "should destroy blog_card" do
    assert_difference('Blog::Card.count', -1) do
      delete blog_card_url(@blog_card)
    end

    assert_redirected_to blog_cards_url
  end
end
