require 'rails_helper'

describe GithubUser do
  it "it access all key information" do
    raw_user = {
      login: "nmcolome",
      name: "Natalia Colomé",
      avatar_url: "https://avatars1.githubusercontent.com/u/24360249?v=3",
      company: "dream company",
      blog: "www.mypage.com",
      location: "world",
      email: "myemail@email.com",
      bio: "short and sweet bio",
      public_repos: 37,
      followers: 3,
      following: 4,
    }

    github_user = GithubUser.new(raw_user)

    expect(github_user.login).to eq("nmcolome")
    expect(github_user.avatar_url).to eq("https://avatars1.githubusercontent.com/u/24360249?v=3")
    expect(github_user.name).to eq("Natalia Colomé")
    expect(github_user.bio).to eq("short and sweet bio")
    expect(github_user.company).to eq("dream company")
    expect(github_user.location).to eq("world")
    expect(github_user.blog).to eq("www.mypage.com")
    expect(github_user.email).to eq("myemail@email.com")
    expect(github_user.followers).to eq(3)
    expect(github_user.following).to eq(4)
    expect(github_user.public_repos).to eq(37)
  end
end