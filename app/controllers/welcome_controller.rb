class WelcomeController < ApplicationController
  def index
    @entries = Entry.order("id DESC")
    @events  = Event.order("start_at DESC")
  end

  def about
  end
end
