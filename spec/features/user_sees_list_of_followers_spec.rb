require 'rails_helper'

feature 'User sees basic account info' do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  scenario 'as a logged in user' do
    VCR.use_cassette("user_sees_basic_info") do
      visit '/'
      click_link "Sign in with Github"

      expect(page).to have_selector('.avatar')
      expect(page).to have_selector('.name')
      expect(page).to have_selector('.login')
      expect(page).to have_selector('.bio')
      expect(page).to have_selector('.card')
      expect(page).to have_selector('.company')
      expect(page).to have_selector('.location')
      expect(page).to have_selector('.email')
      expect(page).to have_selector('.blog')
    end
  end
end