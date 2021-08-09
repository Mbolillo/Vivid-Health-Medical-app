class Person < ApplicationRecord
    
    enum genders: [:male, :female]
    
    belongs_to :user, dependent: :destroy
    
end
