class HomeController < ApplicationController
  def index
    if current_user
      response = Faraday.get("https://api.github.com/users/#{current_user.nickname}")
      @account = Account.new(JSON.parse(response.body, symbolize_names:true))
      followers_response = Faraday.get("https://api.github.com/users/marinacor1/followers")
      @followers = JSON.parse(followers_response.body, symbolize_names:true).map do |follower_info|
        follower_data = Faraday.get(follower_info[:url])
        Account.new(JSON.parse(follower_data.body, symbolize_names:true))
      end
    end
  end
end