class UsersController < ApplicationController
  def show
    @user    = User.find_by_name(params[:id])
    @effects = @user.effects.order("effected_at DESC")
  end
end
