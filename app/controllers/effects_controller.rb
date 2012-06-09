# -*- coding: utf-8 -*-
class EffectsController < ApplicationController
  before_filter :require_sign_in, :only => [:new, :edit, :create, :update, :edit_tags]

  def index
    @page    = params[:page]
    @effects = Effect.order("id DESC").page(@page).per(10)
    @tags    = Tag.where(:category => nil).order("id DESC")

    @title = "エフェクトの一覧 (全%d件)" % Effect.count
  end

  def show
    @effect = Effect.find(params[:id])

    @title = "#{@effect.user.name}のエフェクト"
  end

  def new
    @effect = Effect.new
    @tag    = params[:tag]

    @hide_new_effect_button = true

    @title = "エフェクトを登録する"
  end

  def edit
    @effect = Effect.find(params[:id])

    unless @effect.user == current_user
      render "public/403", :status => 403
      return
    end

    @title = "エフェクトを編集する"
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

      if params[:twitter]
        @effect.user.tweet(url_for(@effect))
      end

      redirect_to @effect
    else
      @title = "エフェクトを登録する"
      render :action => "new"
    end
  end

  def update
    @effect    = Effect.find(params[:id])

    unless @effect.user == current_user
      render "public/403", :status => 403
      return
    end

    parameters = params[:effect]
    tags       = parameters.delete(:tags).split(/\s+/)

    @effect.update_attributes(parameters)

    @effect.taggings.each do |tagging|
      tagging.destroy unless tags.include? tagging.tag.name
    end

    tags.each do |tag_name|
      tag     = Tag.where(:name => tag_name).first_or_create
      tagging = Tagging.where(:tag_id => tag.id, :effect_id => @effect.id).first_or_create(:user_id => current_user.id)
    end

    if @effect.save
      redirect_to @effect
    else
      @title = "エフェクトを編集する"
      render :action => "edit"
    end
  end

  def edit_tags
    @effect = Effect.find(params[:id])

    @title = "エフェクトのタグを編集する"
  end
end
