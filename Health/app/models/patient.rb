class Patient < Person
    
    has_many :appointments, dependent: :destroy
    has_many :doctors, through: :appointments
    has_many :prescriptions, dependent: :destroy
    has_many :doctors, through: :prescriptions
    has_many :consultations
    
    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
