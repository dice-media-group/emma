require 'test_helper'

class Backstage::MediaAppearancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_media_appearances_index_url
    assert_response :success
  end

end
