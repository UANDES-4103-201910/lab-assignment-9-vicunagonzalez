require 'test_helper'

class CallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get omniauth_auth" do
    get callbacks_omniauth_auth_url
    assert_response :success
  end

end
