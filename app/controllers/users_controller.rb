# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_filter :return_here_after_sign_in, :only => [:show]

  def show
    @user          = User.find_by_name(params[:id])
    @effects       = @user.effects.order("effected_at DESC")
    @contributions = @user.events.order("end_at DESC").map { |e|
      Contribution.find_by_user_id_and_event_id(@user.id, e.id)
    }

    @title = "#{@user.name}と高専カンファレンス"
  end
end
