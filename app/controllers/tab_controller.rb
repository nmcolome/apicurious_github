class TabController < ApplicationController
  def index
    if current_user
      @github_user = GithubUser.current_user_info(current_user.nickname, current_user.token)

      @orgs = Org.get_orgs(current_user.nickname, current_user.token)

    end

    if params[:category] == 'followers'
      @follows = GithubUser.get_followers(current_user.nickname, current_user.token)
    elsif params[:category] == 'following'
      @follows = GithubUser.get_following(current_user.nickname, current_user.token)
    end
  end
end