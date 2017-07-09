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

  private
    attr_reader :attrs
end