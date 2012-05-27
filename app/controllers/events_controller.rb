class EventsController < ApplicationController
  def show
    @event         = Event.find_by_label(params[:id])
    @contributions = @event.contributions.order("id DESC")
    @taggings      = Tag.find_by_name(@event.label).taggings.order("id DESC")

    if signed_in?
      @contribution = Contribution.find_by_user_id_and_event_id(current_user.id, @event.id)
      @contribution ||= Contribution.new
    end
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
