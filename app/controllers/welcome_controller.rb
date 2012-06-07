# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  def index
    @effects = Effect.order("id DESC").limit(4)
    @events  = Event.order("start_at DESC").limit(6)
    @users   = User.order("updated_at DESC").limit(100)
    @tags    = Tag.where(:category => nil).order("id DESC")

    @covers  = Event.where("cover_url IS NOT NULL").reject { |e| e.cover_url.blank? }.take(9).map(&:cover_url).shuffle

    @social_footer = true
  end

  def about
    @title = "このサイトについて"
  end
end
