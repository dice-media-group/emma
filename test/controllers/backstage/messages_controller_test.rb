require 'test_helper'

class Backstage::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_messages_index_url
    assert_response :success
  end

end
