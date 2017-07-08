require 'rails_helper'

feature 'User sees their commits' do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  scenario 'as a logged in user' do
    visit '/'
    click_link "Sign in with Github"

    expect(page).to have_content("Contribution Activity")
    expect(page).to have_selector('.date')
    expect(page).to have_selector('.owner_repo')
    expect(page).to have_selector('.commits')
  end
end