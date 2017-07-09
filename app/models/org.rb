class Org
  attr_reader :login,
              :avatar_url

  def initialize(attrs)
    @attrs = attrs
    @login = attrs[:login]
    @avatar_url = attrs[:avatar_url]
  end

  def self.get_orgs(login, token)
    organizations = GithubService.get_orgs(login, token)

    organizations.map do |org_login|
      current_user_info(org_login, token)
    end
  end

  private
    attr_reader :attrs
end