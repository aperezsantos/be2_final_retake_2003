class Doctor <ApplicationRecord
  belongs_to :hospital
  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors
end
