class Doctor < Person
    
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    has_many :prescriptions, dependent: :destroy
    has_many :patients, through: :prescriptions
    
    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
