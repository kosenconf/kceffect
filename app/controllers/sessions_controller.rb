class SessionsController < ApplicationController
  def create
    auth          = request.env["omniauth.auth"]
    twitter_id    = auth["uid"]
    name          = auth["info"]["nickname"]
    icon_url      = auth["info"]["image"]
    profile       = auth["info"]["description"]
    access_token  = auth["credentials"]["token"]
    access_secret = auth["credentials"]["token"]

    user = User.find_by_twitter_id(twitter_id) || User.new

    user.twitter_id    = twitter_id
    user.name          = name
    user.icon_url      = icon_url
    user.profile       = profile
    user.access_token  = access_token
    user.access_secret = access_secret
    user.save

    self.current_user = user

    if session[:return_to]
      redirect_to session.delete(:return_to)
    else
      redirect_to root_path
    end
  end

  def destroy
    self.sign_out!
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
