class WelcomeController < ApplicationController
  def index
    @entries = Entry.order("id DESC")
    @events  = Event.order("start_at DESC")
  end
end
