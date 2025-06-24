class RenameResetPasswordSendAtToSentAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :reset_password_send_at, :reset_password_sent_at
  end
  
end
