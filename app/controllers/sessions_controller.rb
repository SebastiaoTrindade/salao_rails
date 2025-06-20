class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]&.downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Login realizado com sucesso!"
      redirect_to after_login_path(user)
    else
      flash.now[:danger] = "Email ou senha inválidos."
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Logout realizado com sucesso!"
    redirect_to root_path
  end

  private
  def after_login_path(user)
    user.admin? ? admin_dashboard_path : customers_dashboard_path 
  end
end
