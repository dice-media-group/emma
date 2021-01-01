require 'test_helper'

class Backstage::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backstage_books_index_url
    assert_response :success
  end

end
