# -*- coding: utf-8 -*-
class EventsController < ApplicationController
  before_filter :require_sign_in,           :only => [:new, :create, :edit, :update]
  before_filter :return_here_after_sign_in, :only => [:index, :show]

  def index
    @events = Event.order("start_at, label")

    @title = "これまでに開催されたイベントの一覧"
  end

  def show
    @page = params[:page]

    @event         = Event.find_by_label(params[:id])
    @contributions = @event.contributions.order("id DESC")
    @taggings      = Tag.find_by_name(@event.label).taggings.order("id DESC").page(@page).per(10)

    @prev_event = Event.where("start_at < ?", @event.start_at).order("start_at DESC, label").first
    @next_event = Event.where("start_at > ?", @event.start_at).order("start_at ASC,  label").first

    if signed_in?
      @contribution = Contribution.find_by_user_id_and_event_id(current_user.id, @event.id)
      @contribution ||= Contribution.new
    end

    @title = "%s (%s)" % [@event.name, @event.label]
  end

  def new
    @event = Event.new

    @title = "開催イベントを新しく登録する"
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

    @title = "開催イベントの情報を編集する"
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
