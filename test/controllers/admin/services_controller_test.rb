require 'test_helper'

class Admin::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_services_index_url
    assert_response :success
  end

end
