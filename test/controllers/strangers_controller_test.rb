require "test_helper"

class StrangersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get strangers_index_url
    assert_response :success
  end
end
