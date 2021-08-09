class Appointment < ApplicationRecord
    enum status: [:booked, :cancelled, :rescheduled]
    belongs_to :doctor
    belongs_to :patient
end
