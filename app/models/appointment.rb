class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :date, :time, :status, :service_id, presence: true
end
