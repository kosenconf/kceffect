class SessionsController < ApplicationController
  def create
    auth          = request.env["omniauth.auth"]
    twitter_id    = auth["uid"]
    name          = auth["info"]["nickname"]
    icon_url      = auth["info"]["image"]
    access_token  = auth["credentials"]["token"]
    access_secret = auth["credentials"]["token"]

    if user = User.find_by_twitter_id(twitter_id)
      self.current_user = user
      redirect_to root_path
      return
    end

    user = User.new
    user.twitter_id    = twitter_id
    user.name          = name
    user.icon_url      = icon_url
    user.access_token  = access_token
    user.access_secret = access_secret

    user.save!
    self.current_user = user
    redirect_to root_path
  end

  def destroy
    self.sign_out!
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
