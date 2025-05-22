class Admin::DashboardController < ApplicationController
  before_action :require_admin
  layout 'admin_dashboard'

  def index
    @users = User.all
    @services = Service.all
    @appoitments = Appointment.all
  end
end
