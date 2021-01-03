require 'test_helper'

class Site::BiographyControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get site_biography_edit_url
    assert_response :success
  end

end
