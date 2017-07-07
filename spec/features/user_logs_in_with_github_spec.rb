require 'rails_helper'

RSpec.describe 'user' do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

    it 'logs in' do
      visit '/'

      assert_equal 200, page.status_code

      click_link "Sign in with Github"

      assert_equal "/", current_path
      assert page.has_content?("jdoe")
      assert page.has_link?("Sign out")
    end
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "1234",
      info: {
        nickname: "jdoe",
        email: "jdoe@email.com",
        name: "Jane Doe",
        image: "image_path",
      },
      credentials: {
        token: "secret"
      }
    })
  end
end
