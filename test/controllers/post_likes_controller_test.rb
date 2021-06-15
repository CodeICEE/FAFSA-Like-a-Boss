require "test_helper"

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get post_likes_update_url
    assert_response :success
  end
end
