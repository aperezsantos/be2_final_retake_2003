require 'rails_helper'


RSpec.describe Surgery do
  describe 'relationships' do
    it {should have_many :surgery_doctors}
    it {should have_many(:doctors).through(:surgery_doctors)}
  end


  describe 'methods' do
    it ".same_day" do
      surgeries = Surgery.all
      unmh = Hospital.create!(name: "UNM Hospital", street: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      doctor_1 = unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      doctor_2 = unmh.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")
      surgery_1 = Surgery.create!(title: "Knee Surgery", day: "Monday", room: "8")
      surgery_2 = Surgery.create!(title: "Heart Surgery", day: "Monday", room: "3")
      surgery_3 = Surgery.create!(title: "Lung Surgery", day: "Thursday", room: "3")
      SurgeryDoctor.create!(doctor: doctor_1, surgery: surgery_2)
      SurgeryDoctor.create!(doctor: doctor_2, surgery: surgery_2)

      expect(surgeries.same_day).to eq([surgery_1, surgery_2])
    end
  end
end
