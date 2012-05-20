class EventsController < ApplicationController
  def show
    @event = Event.find_by_label(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    parameters = params[:event]

    @event = Event.new(parameters)

    if @event.save
      redirect_to @event
    else
      render :action => "new"
    end
  end

  def edit
    @event = Event.find_by_label(params[:id])
  end

  def update
    parameters = params[:event]
    @event = Event.find_by_label(params[:id])

    if @event.update_attributes(parameters)
      redirect_to @event
    else
      render :action => "edit"
    end
  end
end
