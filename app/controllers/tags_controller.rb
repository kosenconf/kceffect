# -*- coding: utf-8 -*-
class TagsController < ApplicationController
  before_filter :return_here_after_sign_in, :only => [:show]

  def show
    @tag      = Tag.find_by_name(params[:id])
    @taggings = @tag.taggings.order("id DESC")
    @tags     = Tag.where(:category => nil).order("id DESC")

    @title = "タグ「#{@tag.name}」がつけられたエフェクト"
  end
end
