class EffectsController < ApplicationController
  def show
    @effect = Effect.find(params[:id])
  end

  def new
    @effect = Effect.new
  end

  def edit
    @effect = Effect.find(params[:id])
  end

  def create
    parameters = params[:effect]

    @effect = Effect.new(parameters)
    @effect.user = current_user

    if @effect.save
      redirect_to @effect
    else
      render :action => "new"
    end
  end

  def update
    @effect    = Effect.find(params[:id])
    parameters = params[:effect]

    @effect.url         = parameters[:url]
    @effect.comment     = parameters[:comment]
    @effect.effected_at = parameters[:effected_at]

    if @effect.save
      redirect_to @effect
    else
      render :action => "edit"
    end
  end
end
