class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to login_path
    end
  end

  def require_admin 
    unless current_user&.admin?
    flash[:alert] = "Acesso restrito a administradores."
    redirect_to root_path
    end
  end

  def require_customer
    redirect_to login_path unless current_user && !current_user.admin?
  end
end
