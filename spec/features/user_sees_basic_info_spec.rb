require 'rails_helper'

feature 'User sees basic account info' do
  scenario 'as a logged in user' do
    visit '/'
    expect(page).to have_selector('avatar', count: 10)

  end
end