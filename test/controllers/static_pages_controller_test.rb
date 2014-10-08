require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get wallet" do
    get :wallet
    assert_response :success
  end

end
