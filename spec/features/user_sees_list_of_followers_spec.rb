require 'rails_helper'

feature "User sees list of their followers" do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  scenario 'as a logged in user' do
    VCR.use_cassette("user_sees_their_followers") do
      visit '/'
      click_link "Sign in with Github"
      click_link "Followers"

      expect(page).to have_selector('.s_avatar')
      expect(page).to have_selector('.follow_data')
      expect(page).to have_selector('.name_data')
      expect(page).to have_selector('.follower_name')
      expect(page).to have_selector('.bio')
      expect(page).to have_selector('.contact_data')
    end
  end
end