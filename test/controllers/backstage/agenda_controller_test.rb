require 'test_helper'

class Backstage::AgendaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_agenda_index_url
    assert_response :success
  end

end
