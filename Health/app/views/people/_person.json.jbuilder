json.extract! person, :id, :photo, :first_name, :last_name, :dob, :address, :phone, :gender, :discipline, :hourly_rate, :bio, :type, :user_id, :created_at, :updated_at
json.url person_url(person, format: :json)
