json.extract! appointment, :id, :appointment_date, :appointment_time, :total_hours, :status, :patient_id, :doctor_id, :payment_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
