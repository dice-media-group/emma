require 'test_helper'

class Backstage::FirstTimeControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get backstage_first_time_edit_url
    assert_response :success
  end

  test "should get _form" do
    get backstage_first_time__form_url
    assert_response :success
  end

end
