require 'test_helper'

class ThemeAvatarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theme_avatars_index_url
    assert_response :success
  end

end
