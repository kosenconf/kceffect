class TagsController < ApplicationController
  def show
    @tag      = Tag.find_by_name(params[:id])
    @taggings = @tag.taggings.order("id DESC")
  end
end
