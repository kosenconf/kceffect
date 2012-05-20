class WelcomeController < ApplicationController
  def index
    @entries = Entry.order(:id)
    @events  = Event.order(:start_at)
  end
end
