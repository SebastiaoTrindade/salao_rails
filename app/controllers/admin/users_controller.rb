class Admin::UsersController < ApplicationController
  before_action :require_admin
  layout 'admin_dashboard'

  def index
    @users = User.all
  end
end
