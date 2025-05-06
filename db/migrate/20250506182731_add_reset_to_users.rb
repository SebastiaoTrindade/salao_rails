class AddResetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_send_at, :datetime
  end
end
