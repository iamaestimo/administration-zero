require "test_helper"

class Backend::HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_backend_as(backend_users(:lazaro_nixon))
  end

  test "should get index" do
    get backend_url
    assert_response :success
  end
end
