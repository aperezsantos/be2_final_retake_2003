require 'rails_helper'

RSpec.describe "surgery show page", type: :feature do
  describe "when i visit /surgeries/:id" do
    before(:each) do
      @unmh = Hospital.create!(name: "UNM Hospital", street: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      @doctor_1 = @unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")
      @doctor_2 = @unmh.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")
      @doctor_3 = @unmh.doctors.create!(name: "T. Lucero", specialty: "Respiratory", education: "Harvard")
      @surgery_1 = Surgery.create!(title: "Knee Surgery", day: "Monday", room: "8")
      @surgery_2 = Surgery.create!(title: "Heart Surgery", day: "Monday", room: "3")
      @surgery_3 = Surgery.create!(title: "Lung Surgery", day: "Thursday", room: "3")
      SurgeryDoctor.create!(doctor: @doctor_1, surgery: @surgery_2)
      SurgeryDoctor.create!(doctor: @doctor_2, surgery: @surgery_2)
      SurgeryDoctor.create!(doctor: @doctor_3, surgery: @surgery_2)

      visit "/surgeries"
    end

    it "i can click on an individual surgery title" do
      click_link("Heart Surgery")

      expect(current_path).to eq("/surgeries/#{@surgery_2.id}")

      expect(page).to have_content("Heart Surgery")
      expect(page).to have_content("Operating Room: 3")
      expect(page).to have_content("Knee Surgery")
      expect(page).to_not have_content("Lung Surgery")
    end

    it "i see the count of doctors on this surgery" do
      click_link("Heart Surgery")

      expect(page).to have_content("Number of Doctors Operating: 3")
    end

    it "i see a section with other surgeries happening the same day" do
      click_link("Heart Surgery")

      within(".surgeries")
        expect(page).to have_content("Other Surgeries Happening Today:")
        expect(page).to have_content(@surgery_1.title)
        expect(page).to have_content(@surgery_2.title)
        expect(page).to_not have_content(@surgery_3.title)
      end
    end


    # it "I see instructions of how to add a doctor to the surgery " do
    #   click_link("Heart Surgery")
    #
    #   expect(page).to have_content("Add a Doctor Form:")
    #
    #   fill_in :doctor_id, with: "3"
    #
    #   click_on("Add Doctor")
    #   expect(current_path).to eq("/surgeries/#{@surgery_2.id}")
    #
    #   expect(page).to have_content("T.Lucero")
    # end
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








# User Story 3, Add a Doctor to a Surgery
# As a visitor
# When I visit a surgery's show page
# I see a surgery's title, date, and

# I see a field with instructions to "Add A Doctor To This Surgery"
# When I input a doctor's unique id into that field
# And click submit
# I'm taken back to that surgery's show page
# And I see the name of that doctor listed on the page
