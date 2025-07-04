class User < ApplicationRecord
  has_secure_password
  has_many :appointments

  def generate_password_reset_token!
    loop do
      token = SecureRandom.urlsafe_base64
      unless User.exists?(reset_password_token: token)
        update!(
          reset_password_token: token,
          reset_password_sent_at: Time.current
        )    
      break
      end
    end       
  end

  def password_token_valid?
    reset_password_sent_at.present? && reset_password_sent_at + 2.hours > Time.current
  end
  
  def reset_password!(new_password)  
    self.password = new_password
    self.reset_password_token = nil
    self.reset_password_sent_at = nil   
    save!
  end

  
end
