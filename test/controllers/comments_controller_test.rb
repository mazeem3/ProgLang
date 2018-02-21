require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get posts" do
    get comments_posts_url
    assert_response :success
  end

end
