class PasswordResetMailer < ApplicationMailer

  default from: 'sebatrindade@gmail.com'

  def reset_email(user)
    @user = params[:user]
    @url = edit_password_reset_url(token: @user.reset_password_token)
    mail(to: @user.email, subject: 'Redefinição de Senha')
  end
end
