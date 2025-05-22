class Customers::DashboardController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    #@appoitments = current_user.appointments
    @services = Service.all
  end

  
end
