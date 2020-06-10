require 'rails_helper'

RSpec.describe "surgery’s index page", type: :feature do
  describe "when i visit /surgeries" do
    before(:each) do
      @unmh = Hospital.create!(name: "UNM Hospital", street: "2211 Lomas Blvd. NE", city: "Albuquerque", state: "NM", zip: 87106)
      @doctor_1 = @unmh.doctors.create!(name: "T. Fernandes", specialty: "Oncology", education: "Harvard")
      @doctor_2 = @unmh.doctors.create!(name: "S. Santos", specialty: "Pediatrics", education: "Cornell")

      @surgery_1 = @doctor_1.surgeries.create!(title: "Knee Surgery", day: "Monday", room: "8")
      @surgery_1 = @doctor_2.surgeries.create!(title: "Heart Surgery", day: "Monday", room: "3")

      visit "/surgeries"
    end

    it "i see a list of all surgeries" do
      expect(page).to have_content("Knee Surgery")
      expect(page).to have_content("Heart Surgery")
    end

    it "i can click on a link add a surgery" do
      click_link("Add Surgery")

      expect(current_path).to eq("/surgeries/new")

      fill_in :title, with: "Lung Surgery"
      fill_in :day, with: "Wednesday"
      fill_in :room, with: "8"

      click_on "Create Surgery"
      expect(current_path).to eq("/surgeries")
      expect(page).to have_content("Lung Surgery")
    end
  end
end

# User Story 1, Creating a Surgery
# As a visitor
# When I visit a surgery’s index page
# I see the title of all surgeries in my database
# I also see a link to add a surgery
# When I click that link
# I’m taken to a new form to create a surgery
# When I fill in the form with a title, day of the week, and operating room number
# And hit submit
# I am taken back to the surgeries index page where I can see this new surgery’s title listed
