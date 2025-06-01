class Customers::AppointmentsController < ApplicationController
  before_action :require_customer
  layout 'customer_dashboard'

  def index
    @appointments = current_user.appointments.includes(:service)
  end

  def create
    date = params[:date]
    time = params[:time]

    datetime = DateTime.parse("#{date} #{time}") rescue nil

    @appointments = Appointment.new(
      user_id: current_user.id,
      service_id: params[:service_id],
      date: date,
      time: datetime,
      status: "pendente"
    ) 
    
    if @appointments.save
      flash[:success] = "Agendamento realizado com sucesso!"
      redirect_to customers_appointments_path
    else
      flash.now[:alert] = "Erro ao realizar o agendamento."
      redirect_to customers_services_path
    end    
  end

  private
  def appointments_params
    params.permit(:date, :time, :service_id)
  end
end
