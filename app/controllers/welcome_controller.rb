class WelcomeController < ApplicationController
  def index
    @effects = Effect.order("id DESC")
    @events  = Event.order("start_at DESC")
    @tags    = Tag.where(:category => nil).order("id DESC")

    @covers  = Event.where("cover_url IS NOT NULL").reject { |e| e.cover_url.blank? }.map(&:cover_url).shuffle
  end

  def about
  end
end
