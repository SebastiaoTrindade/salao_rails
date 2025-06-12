class Admin::AppointmentsController < ApplicationController
  before_action :require_admin
  layout 'admin_dashboard'

  def index
    @appointments = Appointment.all
  end
end
