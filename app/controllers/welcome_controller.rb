class WelcomeController < ApplicationController
  def index
    @effects = Effect.order("id DESC")
    @events  = Event.order("start_at DESC")
  end

  def about
  end
end
