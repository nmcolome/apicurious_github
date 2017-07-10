require 'rails_helper'

feature "User sees list of their repos" do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  scenario 'as a logged in user' do
    VCR.use_cassette("user_sees_their_repos") do
      visit '/'
      click_link "Sign in with Github"
      visit "/tab?category=repositories"

      expect(page).to have_selector('.repo_name')
      expect(page).to have_selector('.description')
      expect(page).to have_selector('.language')
      expect(page).to have_selector('.parent_full_name')
      expect(page).to have_selector('.forks')
      expect(page).to have_selector('.updated_at')
    end
  end
end