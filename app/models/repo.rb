class Repo
  attr_reader :name,
              :forked,
              :description,
              :updated_at,
              :parent_full_name,
              :language,
              :forks

  def initialize(attrs)
    @attrs = attrs
    @name = attrs[:name]
    @forked = attrs[:fork]
    @description = attrs[:description]
    @updated_at = attrs[:updated_at]
    @parent_full_name = attrs[:parent][:full_name] if @forked
    @language = attrs[:language]
    @forks = attrs[:parent][:forks_count] if @forked
  end

  def self.get_repos(login, token)
    repos = GithubService.get_repos(login, token)

    repos.map do |repo_path|
      get_repo_data(repo_path, token)
    end
  end

  def self.get_repo_data(login, token)
    new(GithubService.get_repo_data(login, token))
  end

  private
    attr_reader :attrs
end