require "test_helper"

class DiaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diary_index_url
    assert_response :success
  end
end
