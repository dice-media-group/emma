require 'test_helper'

class Backstage::PublisherAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_publisher_accounts_index_url
    assert_response :success
  end

end
