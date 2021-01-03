require 'test_helper'

class Backstage::GetInContactContentControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get backstage_get_in_contact_content_edit_url
    assert_response :success
  end

  test "should get _form" do
    get backstage_get_in_contact_content__form_url
    assert_response :success
  end

end
