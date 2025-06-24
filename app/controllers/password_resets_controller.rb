class PasswordResetsController < ApplicationController
  def new
  end   

  def create
    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_password_reset_token!
      PasswordResetMailer.with(user: user).reset_email.deliver_now
    else
      flash[:notice] = "Email enviado com sucesso! Verifique sua caixa de entrada ou spam." 
      redirect_to new_password_reset_path
    end
  end

  def edit  
    @user = User.find_by(reset_password_token: params[:token])
    if @user.nil? || !@user.password_token_valid?      
      redirect_to new_password_reset_path, alert: "Token inválido ou expirado."
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])

    if @user.present? && @user.password_token_valid? 
      if @user.reset_password!(params[:user][:password])
        redirect_to login_path, notice: "Senha alterada com sucesso!"
      else
        render :edit    
      end
    else
      redirect_to new_password_reset_path, alert: "Token inválido ou expirado."
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

