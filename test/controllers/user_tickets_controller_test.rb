require 'test_helper'

class UserTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_tickets_index_url
    assert_response :success
  end

  test "should get create" do
    get user_tickets_create_url
    assert_response :success
  end

  test "should get new" do
    get user_tickets_new_url
    assert_response :success
  end

end
