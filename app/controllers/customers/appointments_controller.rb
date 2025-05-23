class Customers::AppointmentsController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    @appointments = current_user.appointments
  end

  def create
    @appointments = Appointments.new(
    user_id = params[:user_id]
    service_id = params[:service_id]
    date = params[:date]
    time = params[:time]
    )

    if @appointments.save
      redirect_to customers_dashboard_path, notice: "Agendamento realizado com sucesso!"
    else
      redirect_to customers_services_path, alert: "Erro ao realizar o agendamento."
    end
    
  end
end
