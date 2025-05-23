class Customers::ServicesController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    @service_types = Service.all
    @appointment = Appointment.new
    @data = Date.today
    @horarios_disponiveis = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
  end
end
