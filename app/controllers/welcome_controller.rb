class WelcomeController < ApplicationController
  def index
    @entries = Entry.order("id DESC").limit(10)
  end
end
