class EffectsController < ApplicationController
  def show
    @effect = Effect.find(params[:id])
  end

  def new
    @effect = Effect.new
    @tag    = params[:tag]
  end

  def edit
    @effect = Effect.find(params[:id])
  end

  def create
    parameters = params[:effect]
    tags       = parameters.delete(:tags)

    @effect = Effect.new(parameters)
    @effect.user = current_user

    if @effect.save
      tags.split(/\s+/).each do |tag_name|
        tag     = Tag.where(:name => tag_name).first_or_create
        tagging = Tagging.where(:tag_id => tag.id, :effect_id => @effect.id).first_or_create(:user_id => current_user.id)
      end

      redirect_to @effect
    else
      render :action => "new"
    end
  end

  def update
    @effect    = Effect.find(params[:id])
    parameters = params[:effect]
    tags       = parameters.delete(:tags)

    @effect.update_attributes(parameters)

    tags.split(/\s+/).each do |tag_name|
      tag     = Tag.where(:name => tag_name).first_or_create
      tagging = Tagging.where(:tag_id => tag.id, :effect_id => @effect.id).first_or_create(:user_id => current_user.id)
    end

    if @effect.save
      redirect_to @effect
    else
      render :action => "edit"
    end
  end
end
