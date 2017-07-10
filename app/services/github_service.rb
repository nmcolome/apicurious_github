class GithubService
  def initialize(login, token)
    # @attr = attr
    @login = login
    @token = token
  end

  def current_user_info
    response = Faraday.get("https://api.github.com/users/#{login}?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)
  end

  def get_orgs
    response = Faraday.get("https://api.github.com/users/#{login}/orgs?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    organizations = json_response.map { |org| org[:login] }
  end

  def get_followers
    response = Faraday.get("https://api.github.com/users/#{login}/followers?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    logins = json_response.map { |follower| follower[:login] }
  end

  def get_following
    response = Faraday.get("https://api.github.com/users/#{login}/following?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    logins = json_response.map { |following| following[:login] }
  end

  def get_repos
    response = Faraday.get("https://api.github.com/users/#{login}/repos?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)

    repos = json_response.map { |repo| repo[:full_name] }
  end

  def get_repo_data
    response = Faraday.get("https://api.github.com/repos/#{login}?access_token=#{token}")

    json_response = JSON.parse(response.body, symbolize_names:true)
  end

  def self.current_user_info(login, token)
    new(login, token).current_user_info
  end

  def self.get_orgs(login, token)
    new(login, token).get_orgs
  end

  def self.get_followers(login, token)
    new(login, token).get_followers
  end

  def self.get_following(login, token)
    new(login, token).get_following
  end

  def self.get_repos(login, token)
    new(login, token).get_repos
  end

  def self.get_repo_data(login, token)
    new(login, token).get_repo_data
  end

  private
    attr_reader :login,
                :token,
                :conn,
                # :attr
    
    def default_filter
      {
        access_token: token,
        login: login
      }
    end
end

#check if current_user is accessible here