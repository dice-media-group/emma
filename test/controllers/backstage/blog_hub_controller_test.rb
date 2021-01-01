require 'test_helper'

class Backstage::BlogHubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_blog_hub_index_url
    assert_response :success
  end

end
