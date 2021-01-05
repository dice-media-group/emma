require 'test_helper'

class Backstage::MerchandiseLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_merchandise_links_index_url
    assert_response :success
  end

end
