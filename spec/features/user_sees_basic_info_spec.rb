require 'rails_helper'

feature 'User sees basic account info' do
  scenario 'as a logged in user' do
    # As a user
    # When I visit "/"
    visit '/'
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_selector('.station', count: 10) #save te rest for the unit level

    # And the stations should be limited to Electric and Propane --- check this at the unit level
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within first('.station') do
      expect(page).to have_selector('.station_name')
      expect(page).to have_selector('.station_address')
      expect(page).to have_selector('.station_fuel_types')
      expect(page).to have_selector('.station_distance')
      expect(page).to have_selector('.station_access_times')
    end
  end
end