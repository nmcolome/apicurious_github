require 'rails_helper'

describe Org do
  it "it access picture and login" do
    raw_data = {
      login: "turingschool",
      avatar_url: "https://avatars3.githubusercontent.com/u/7934292?v=3"
    }

    organization = Org.new(raw_data)

    expect(organization.login).to eq("turingschool")
    expect(organization.avatar_url).to eq("https://avatars3.githubusercontent.com/u/7934292?v=3")
  end
end