class UsersController < ApplicationController
  def show
    @user          = User.find_by_name(params[:id])
    @effects       = @user.effects.order("effected_at DESC")
    @contributions = @user.events.order("end_at DESC").map { |e|
      Contribution.find_by_user_id_and_event_id(@user.id, e.id)
    }
  end
end
