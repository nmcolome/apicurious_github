class Account
  attr_reader :login,
              :name,
              :public_repos,
              :public_gists,
              :followers,
              :following,
              :company,
              :location,
              :blog,
              :avatar_url,
              :email,
              :bio

  def initialize(attrs)
    @attrs = attrs
    @avatar_url = attrs[:avatar_url]
    @login = attrs[:login]
    @name = attrs[:name]
    @public_repos = attrs[:public_repos]
    @public_gists = attrs[:public_gists]
    @followers = attrs[:followers]
    @following = attrs[:following]
    @company = attrs[:company]
    @location = attrs[:location]
    @blog = attrs[:blog]
    @email = attrs[:email]
    @bio = attrs[:bio]
  end

  private
    attr_reader :attrs
end