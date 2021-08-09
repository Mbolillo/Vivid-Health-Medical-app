class Prescription < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient
    mount_uploader :prescription, PhotoUploader
    validate  :image_size
    
    
  private
    # Validates the size of an uploaded prescription picture.
    def image_size
      if prescription.size > 5.megabytes
        errors.add(:prescription, "should be less than 5MB")
      end
    end
end
