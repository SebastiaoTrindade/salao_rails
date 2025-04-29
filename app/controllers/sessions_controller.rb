class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login realizado com sucesso!"
      redirect_to root_path
    else
      flash.now[:danger] = "Email ou senha inválidos."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout realizado com sucesso!"
    redirect_to login_path
  end
end
