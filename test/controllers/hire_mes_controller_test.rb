require 'test_helper'

class HireMesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hire_me = hire_mes(:one)
  end

  test "should get index" do
    get hire_mes_url
    assert_response :success
  end

  test "should get new" do
    get new_hire_me_url
    assert_response :success
  end

  test "should create hire_me" do
    assert_difference('HireMe.count') do
      post hire_mes_url, params: { hire_me: { billboard_image_filename: @hire_me.billboard_image_filename, body: @hire_me.body, headline: @hire_me.headline, site_id: @hire_me.site_id } }
    end

    assert_redirected_to hire_me_url(HireMe.last)
  end

  test "should show hire_me" do
    get hire_me_url(@hire_me)
    assert_response :success
  end

  test "should get edit" do
    get edit_hire_me_url(@hire_me)
    assert_response :success
  end

  test "should update hire_me" do
    patch hire_me_url(@hire_me), params: { hire_me: { billboard_image_filename: @hire_me.billboard_image_filename, body: @hire_me.body, headline: @hire_me.headline, site_id: @hire_me.site_id } }
    assert_redirected_to hire_me_url(@hire_me)
  end

  test "should destroy hire_me" do
    assert_difference('HireMe.count', -1) do
      delete hire_me_url(@hire_me)
    end

    assert_redirected_to hire_mes_url
  end
end
