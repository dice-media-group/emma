require 'test_helper'

class Broadcaster::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get broadcaster_dashboard_index_url
    assert_response :success
  end

end
