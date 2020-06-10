require 'rails_helper'

RSpec.describe "surgery show page", type: :feature do
  describe "when i visit /surgeries/:id" do
    before(:each) do
      @unmh = Hospital.create!(name: "UNM Hospital", street: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      @doctor_1 = @unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      @doctor_2 = @unmh.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")
      @surgery_1 = Surgery.create!(title: "Knee Surgery", day: "Monday", room: "8")
      @surgery_2 = Surgery.create!(title: "Heart Surgery", day: "Monday", room: "3")
      SurgeryDoctor.create!(doctor: @doctor_1, surgery: @surgery_2)
      SurgeryDoctor.create!(doctor: @doctor_2, surgery: @surgery_2)

      visit "/surgeries"
    end

    it "i can click on an individual surgery title" do
      click_link("Heart Surgery")

      expect(current_path).to eq("/surgeries/#{@surgery_2.id}")

      expect(page).to have_content("Heart Surgery")
      expect(page).to have_content("Operating Room: 3")
      expect(page).to_not have_content("Knee Surgery")
    end

    it "i see the count of doctors on this surgery" do
      click_link("Heart Surgery")
      
      expect(page).to have_content("Number of Doctors Operating: 2")
    end
  end
end



# User Story 2 ,
# Surgery Show Page
# As a visitor
# When I visit the surgery index page
# I can click on any surgery title to take me to that surgery’s show page
# And on the show page I see the title and operating room number of that surgery

# And I see the count of doctors that are on this surgery

# And I see a section of the page that says "Other surgeries happening this day of the week:"
# And under that header I see titles of all surgeries that happen on the same day of the week as this surgery.
