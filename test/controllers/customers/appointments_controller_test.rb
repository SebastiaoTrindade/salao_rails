require 'test_helper'

class Customers::AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_appointments_index_url
    assert_response :success
  end

  test "should get create" do
    get customers_appointments_create_url
    assert_response :success
  end

end
