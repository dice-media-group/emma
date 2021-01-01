require 'test_helper'

class Backstage::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_settings_index_url
    assert_response :success
  end

end
