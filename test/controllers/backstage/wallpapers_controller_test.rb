require 'test_helper'

class Backstage::WallpapersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_wallpapers_index_url
    assert_response :success
  end

end
