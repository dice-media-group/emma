require 'test_helper'

class Backstage::PressKitLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_press_kit_links_index_url
    assert_response :success
  end

end
