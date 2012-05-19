class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    parameters = params[:entry]

    @entry = Entry.new(parameters)
    @entry.user = current_user

    if @entry.save
      redirect_to @entry
    else
      render :action => "new"
    end
  end

  def update
    @entry     = Entry.find(params[:id])
    parameters = params[:entry]

    @entry.url     = parameters[:url]
    @entry.comment = parameters[:comment]

    if @entry.save
      redirect_to @entry
    else
      render :action => "edit"
    end
  end
end
