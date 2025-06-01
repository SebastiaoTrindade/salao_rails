class Customers::AppointmentsController < ApplicationController
  before_action :require_customer
  before_action :set_appointment, only: [:edit, :update]
  layout 'customer_dashboard'

  def index
    @appointments = current_user.appointments.includes(:service)   
    @appointments_count = current_user.appointments.count
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

  def edit
    @service_types = Service.all
    @horarios_disponiveis = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
  end
  def update
   if @appointment.update(appointments_params)
    flash[:success] = "Agendamento atualizado com sucesso!"
    redirect_to customers_appointments_path
   else
    flash.now[:alert] = "Erro ao atualizar o agendamento."
    render :edit
  end
end

  private
  def appointments_params
    params.require(:appointment).permit(:date, :time, :service_id, :description, :status)
  end

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Agendamento não encontrado."
    redirect_to edit_customers_appointments_path
  end
end

