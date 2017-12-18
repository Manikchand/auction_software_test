require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_out" do
    get login_sign_out_url
    assert_response :success
  end

  test "should get login" do
    get login_login_url
    assert_response :success
  end

  test "should get log_in" do
    get login_log_in_url
    assert_response :success
  end

end
