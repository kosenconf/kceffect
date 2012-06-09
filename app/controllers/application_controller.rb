class ApplicationController < ActionController::Base
  before_filter :please_sign_in_again

  protect_from_forgery

  helper_method :current_user, :signed_in?, :sign_out!

  protected

  def please_sign_in_again
    if signed_in?
      if current_user.access_token == current_user.access_secret
        sign_out!
        redirect_to root_path
        return
      end
    end
  end

  def require_sign_in
    unless signed_in?
      render "public/403", :status => 403
      return
    end
  end

  def return_here_after_sign_in
    unless signed_in?
      session[:return_to] = request.fullpath
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def signed_in?
    !!current_user
  end

  def sign_out!
    session.delete :user_id
  end
end
