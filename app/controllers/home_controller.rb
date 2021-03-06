class HomeController < ApplicationController
  def index
    if current_user
      @github_user = GithubUser.current_user_info(current_user.nickname, current_user.token)

      @orgs = Org.get_orgs(current_user.nickname, current_user.token)
    end
  end
end