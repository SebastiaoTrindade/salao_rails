class PasswordResetMailer < ApplicationMailer

  default from: 'sebadevsystem@gmail.com'

  def reset_email
    @user = params[:user]
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: @user.email, subject: 'Redefinição de Senha', content_type: "text/html")
  end
end
