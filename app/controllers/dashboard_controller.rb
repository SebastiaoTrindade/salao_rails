class DashboardController < ApplicationController
  before_action :require_user
  def index
    start_date = params[:start_date].presence || 1.month.ago.to_date 
    end_date = params[:end_date].presence || Date.today
    
    #@appointments_by_day = Appointments
    #.where(date: start_date..end_date)
    #.group_by_day(:date)  
    #.count    
  end
end
