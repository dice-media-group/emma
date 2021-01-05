require 'test_helper'

class Backstage::BiographyControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get backstage_biography_edit_url
    assert_response :success
  end

end
