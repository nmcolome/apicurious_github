class HomeController < ApplicationController
  def index
    if current_user
      response = Faraday.get("https://api.github.com/users/#{current_user.nickname}?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
      @account = Account.new(JSON.parse(response.body, symbolize_names:true))
      followers_response = Faraday.get("https://api.github.com/users/marinacor1/followers?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
      @followers = JSON.parse(followers_response.body, symbolize_names:true).map do |follower_info|
        follower_data = Faraday.get(follower_info[:url]+"?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
        Account.new(JSON.parse(follower_data.body, symbolize_names:true))
      end
    end
  end
end