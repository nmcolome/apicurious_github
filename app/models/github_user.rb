class GithubUser
  attr_reader :login,
              :avatar_url,
              :name,
              :bio,
              :company,
              :location,
              :blog,
              :email,
              :followers,
              :following,
              :public_repos

  def initialize(attrs)
    @attrs = attrs
    @login = attrs[:login]
    @avatar_url = attrs[:avatar_url]
    @name = attrs[:name]
    @bio = attrs[:bio]
    @company = attrs[:company]
    @location = attrs[:location]
    @blog = attrs[:blog]
    @email = attrs[:email]
    @followers = attrs[:followers]
    @following = attrs[:following]
    @public_repos = attrs[:public_repos]
  end

  def self.current_user_info(login, token)
    new(GithubService.current_user_info(login, token))
  end

  def self.get_followers(login, token)
    logins = GithubService.get_followers(login, token)

    logins.map do |follower|
      current_user_info(follower, token)
    end
  end

  def self.get_following(login, token)
    logins = GithubService.get_following(login, token)

    logins.map do |following|
      current_user_info(following, token)
    end
  end

  private
    attr_reader :attrs
end