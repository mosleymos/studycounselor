require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get chat" do
    get :chat
    assert_response :success
  end

end
