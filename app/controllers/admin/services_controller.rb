class Admin::ServicesController < ApplicationController
  before_action :require_admin
  layout 'admin_dashboard'
  def index
    @services = Service.all
  end
end
