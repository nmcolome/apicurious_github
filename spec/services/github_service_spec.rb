require 'rails_helper'

RSpec.describe GithubService do
  before(:each) do
    Capybara.app = ApicuriousGithub::Application
    stub_omniauth
  end

  context ".current_user_info" do
    it "returns a hash" do
      VCR.use_cassette("github_service.current_user_info") do
        
        raw_user = GithubService.current_user_info("iandouglas", ENV['my_token'])

        expect(raw_user).to be_a Hash
        expect(raw_user).to have_key(:login)
        expect(raw_user).to have_key(:name)
        expect(raw_user).to have_key(:avatar_url)
        expect(raw_user).to have_key(:company)
        expect(raw_user).to have_key(:blog)
        expect(raw_user).to have_key(:location)
        expect(raw_user).to have_key(:email)
        expect(raw_user).to have_key(:bio)
        expect(raw_user).to have_key(:public_repos)
        expect(raw_user).to have_key(:followers)
        expect(raw_user).to have_key(:following)

        expect(raw_user[:login]).to be_a String
        expect(raw_user[:name]).to be_a String
        expect(raw_user[:avatar_url]).to be_a String
        expect(raw_user[:company]).to be_a String
        expect(raw_user[:blog]).to be_a String
        expect(raw_user[:location]).to be_a String
        expect(raw_user[:email]).to be_a String
        expect(raw_user[:bio]).to be_a String
        expect(raw_user[:public_repos]).to be_an Integer
        expect(raw_user[:followers]).to be_an Integer
        expect(raw_user[:following]).to be_an Integer
      end
    end
  end

  context ".get_orgs" do
    it "returns an array of strings" do
      VCR.use_cassette("github_service.get_orgs") do
        raw_organizations = GithubService.get_orgs("applegrain", ENV['my_token'])
        raw_organization = raw_organizations.first

        expect(raw_organizations).to be_an Array
        expect(raw_organizations.count).to eq(2)
        expect(raw_organization).to be_a String
      end
    end
  end

  context ".get_followers" do
    it "returns an array of strings" do
      VCR.use_cassette("github_service.get_followers") do
        raw_followers = GithubService.get_followers("nmcolome", ENV['my_token'])
        raw_follower = raw_followers.first

        expect(raw_followers).to be_an Array
        expect(raw_followers.count).to eq(3)
        expect(raw_follower).to be_a String
      end
    end
  end
end
