json.extract! appointment, :id, :date, :time, :description, :status, :user_id, :service_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
