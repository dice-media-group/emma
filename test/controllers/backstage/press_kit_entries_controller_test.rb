require 'test_helper'

class Backstage::PressKitEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_press_kit_entries_index_url
    assert_response :success
  end

end
