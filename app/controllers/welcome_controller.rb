class WelcomeController < ApplicationController
  def index
    @effects = Effect.order("id DESC")
    @events  = Event.order("start_at DESC")
    @tags    = Tag.where(:category => nil).order("id DESC")
  end

  def about
  end
end
