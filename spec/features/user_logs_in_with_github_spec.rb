require 'rails_helper'

RSpec.describe 'user' do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  it 'logs in with github' do
    VCR.use_cassette("user_logs_in_with_github") do

      visit '/'

      assert_equal 200, page.status_code

      click_link "Sign in with Github"

      assert_equal "/", current_path
      assert page.has_content?("nmcolome")
      assert page.has_link?("Sign out")
    end
  end
end
