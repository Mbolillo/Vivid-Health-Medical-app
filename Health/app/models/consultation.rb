class Consultation < ApplicationRecord
    belongs_to :patient
    validates :patient_id, presence: true
    validates :content, presence: true, length: { maximum: 140 }
end
