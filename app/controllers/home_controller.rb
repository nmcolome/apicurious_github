class HomeController < ApplicationController
  def index
    if current_user
      response = Faraday.get("https://api.github.com/users/marinacor1?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b") ##{current_user.nickname}
      json_response = JSON.parse(response.body, symbolize_names:true)
      @account = Account.new(json_response)
      
      followers_response = Faraday.get("https://api.github.com/users/marinacor1/followers?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
      @followers = JSON.parse(followers_response.body, symbolize_names:true).map do |follower_info|
        follower_data = Faraday.get(follower_info[:url]+"?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
        Account.new(JSON.parse(follower_data.body, symbolize_names:true))
      end

      orgs_response = Faraday.get("https://api.github.com/users/marinacor1/orgs?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
      @orgs = JSON.parse(orgs_response.body, symbolize_names:true).map do |org_info|
        org_data = Faraday.get(org_info[:url]+"?access_token=4e4086ae85c7b0e17fe9edae295fc748a2c7576b")
        Org.new(JSON.parse(org_data.body, symbolize_names:true))
      end

    end
  end
end