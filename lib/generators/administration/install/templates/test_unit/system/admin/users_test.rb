require "application_system_test_case"

class Admin::UsersTest < ApplicationSystemTestCase
  setup do
    @admin_user = admin_sign_in_as(admin_users(:lazaro_nixon))
  end

  test "visiting the index" do
    visit admin_users_url
    assert_selector "h2", text: "Admin Users"
  end

  test "should create user" do
    visit admin_users_url
    click_on "New Admin User"

    fill_in "Email", with: "lazaronixon@hey.com"
    fill_in "Password", with: "Secret1*3*5*"
    fill_in "Password confirmation", with: "Secret1*3*5*"
    click_on "Create Admin user"

    assert_text "User was successfully created"
  end

  test "should update User" do
    visit admin_user_url(@admin_user)
    click_on "Edit Admin User"

    fill_in "Email", with: @admin_user.email
    fill_in "Password", with: "NewSecret1*3*5*"
    fill_in "Password confirmation", with: "NewSecret1*3*5*"
    click_on "Update Admin user"

    assert_text "User was successfully updated"
  end

  test "should destroy User" do
    visit admin_user_url(@admin_user)
    page.accept_confirm { click_on "Delete Admin User" }

    assert_text "User was successfully destroyed"
  end
end
