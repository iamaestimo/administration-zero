require "application_system_test_case"

class backend::SessionsTest < ApplicationSystemTestCase
  setup do
    @user = Backend_users(:lazaro_nixon)
  end

  test "signing in" do
    visit backend_sign_in_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "Secret1*3*5*"
    click_on "Sign in"

    assert_selector "h1", text: "Backend::Home#index"
  end

  test "signing out" do
    sign_in_backend_as @user
    click_on "Paweł Kuna"
    click_on "Logout"

    assert_selector "h1", text: "Login to your account"
  end
end
