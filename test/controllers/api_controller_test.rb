require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

end
