require 'test_helper'

class Backstage::PressKitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_press_kit_index_url
    assert_response :success
  end

end
