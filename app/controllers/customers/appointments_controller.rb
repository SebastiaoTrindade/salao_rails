class Customers::AppointmentsController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    @appointments = Appointment.where(user_id: current_user.id).includes(:service)
  end

  def create
    @appointments = Appointment.new(
      user_id: params[:user_id],
      service_id: params[:service_id],
      date: params[:date],
      time: params[:time]
    ) 
    
    if @appointments.save
      flash[:success] = "Agendamento realizado com sucesso!"
      redirect_to customers_appointments_path
    else
      flash[:danger] = "Erro ao realizar o agendamento."
      redirect_to customers_services_path
    end    
  end

  private
  def appointments_params
    params.permit(:date, :time, :service_id)
  end
end
