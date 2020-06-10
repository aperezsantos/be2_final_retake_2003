class Surgery <ApplicationRecord
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def self.same_day
    
  end
end
