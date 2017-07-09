class TabController < ApplicationController
  def index
    if current_user
      @github_user = GithubUser.current_user_info(current_user.nickname, current_user.token)

      @orgs = Org.get_orgs(current_user.nickname, current_user.token)

    end

    if params[:category] == 'followers'
      @followers = GithubUser.get_followers(current_user.nickname, current_user.token)
    else
      
    end
  end
end