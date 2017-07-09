require 'rails_helper'

feature "User sees the organizations they're members of" do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  scenario 'as a logged in user' do
    VCR.use_cassette("user_sees_their_organizations") do
      visit '/'
      click_link "Sign in with Github"

      expect(page).to have_content("Organizations")
      # expect(page).to have_selector('.xs_avatar')
    end
  end
end