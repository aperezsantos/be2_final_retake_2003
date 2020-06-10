require 'rails_helper'


RSpec.describe Doctor do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :surgery_doctors}
    it {should have_many(:surgeries).through(:surgery_doctors)}
  end
end
