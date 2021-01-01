require 'test_helper'

class Backstage::MeetupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_meetups_index_url
    assert_response :success
  end

end
