class User < ApplicationRecord
  has_secure_password
  has_many :appointments

  def generate_password_reset_token
    self.reset_password_token = SecureRandom.urlsafe_base64
    self.reset_password_sent_at = Time.current
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 2.hours) > Time.current
  end

  
  #def reset_password!(new password)
    #self.password = new_password
    #self.reset_password_token = nil
    #self.reset_password_sent_at = nil
    #save!
  #end
  
end
