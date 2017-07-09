class GithubService
  def initialize(user, token)
    # @attr = attr
    @user = user
    @token = token
  end

  def current_user_info
    response = Faraday.get("https://api.github.com/users/#{user}?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)
  end

  def get_followers
    response = Faraday.get("https://api.github.com/users/#{user}/followers?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    logins = json_response.map { |follower| follower[:login] }
  end

  def get_orgs
    response = Faraday.get("https://api.github.com/users/#{user}/orgs?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    organizations = json_response.map { |org| org[:login] }
  end

  def self.current_user_info(user, token)
    new(user, token).current_user_info
  end

  def self.get_followers(user,token)
    new(user, token).get_followers
  end

  def self.get_orgs(user,token)
    new(user, token).get_orgs
  end

  private
    attr_reader :user,
                :token,
                :conn,
                # :attr
    
    def default_filter
      {
        access_token: token,
        user: user
      }
    end
end

#check if current_user is accessible here