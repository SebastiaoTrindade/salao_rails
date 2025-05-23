require 'test_helper'

class Customers::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_services_index_url
    assert_response :success
  end

end
