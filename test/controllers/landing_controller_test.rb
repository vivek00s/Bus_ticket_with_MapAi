require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get Dashboard" do
    get landing_Dashboard_url
    assert_response :success
  end
end
