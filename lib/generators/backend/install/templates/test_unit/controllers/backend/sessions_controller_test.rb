require "test_helper"

class Backend::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = backend_users(:lazaro_nixon)
  end

  test "should get new" do
    get backend_sign_in_url
    assert_response :success
  end

  test "should sign in" do
    post backend_sign_in_url, params: { email: @user.email, password: "Secret1*3*5*" }
    assert_redirected_to backend_url

    get backend_url
    assert_response :success
  end

  test "should not sign in with wrong credentials" do
    post backend_sign_in_url, params: { email: @user.email, password: "SecretWrong1*3" }
    assert_redirected_to backend_sign_in_url(email_hint: @user.email)
    assert_equal "That email or password is incorrect", flash[:alert]

    get backend_url
    assert_redirected_to backend_sign_in_url
  end

  test "should sign out" do
    sign_in_backend_as @user

    delete backend_sign_out_url
    assert_redirected_to backend_sign_in_url
  end
end
