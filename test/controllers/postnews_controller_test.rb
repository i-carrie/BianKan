require 'test_helper'

class PostnewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postnews_index_url
    assert_response :success
  end

end
