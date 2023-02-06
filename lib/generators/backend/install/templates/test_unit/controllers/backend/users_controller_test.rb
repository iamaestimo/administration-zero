require "test_helper"

class Backend::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_backend_as(backend_users(:lazaro_nixon))
  end

  test "should get index" do
    get backend_users_url
    assert_response :success
  end

  test "should get new" do
    get new_backend_user_url
    assert_response :success
  end

  test "should create backend_user" do
    assert_difference("backend::User.count") do
      post backend_users_url, params: { backend_user: { email: "lazaronixon@hey.com", password: "Secret1*3*5*", password_confirmation: "Secret1*3*5*" } }
    end

    assert_redirected_to backend_user_url(backend::User.last)
  end

  test "should show backend_user" do
    get backend_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_backend_user_url(@user)
    assert_response :success
  end

  test "should update backend_user" do
    patch backend_user_url(@user), params: { backend_user: { email: @user.email, password: "NewSecret1*3*5*", password_confirmation: "NewSecret1*3*5*" } }
    assert_redirected_to backend_user_url(@user)
  end

  test "should destroy backend_user" do
    assert_difference("backend::User.count", -1) do
      delete backend_user_url(@user)
    end

    assert_redirected_to backend_users_url
  end
end
