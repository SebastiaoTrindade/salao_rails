class Customers::DashboardController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    @appointments_count = current_user.appointments.count
    @services = Service.all
  end

  
end
