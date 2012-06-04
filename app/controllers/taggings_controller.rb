class TaggingsController < ApplicationController
  before_filter :require_sign_in, :only => [:create, :destroy]

  def create
    effect   = Effect.find(params[:tagging][:effect_id])
    tag_name = params[:tag].gsub(/\s/, "")

    tag      = Tag.where(:name => tag_name).first_or_create
    tagging  = Tagging.where(:tag_id => tag.id, :effect_id => effect.id).first_or_create(:user_id => current_user.id)

    render :json => {
      :form => render_to_string(:partial => "taggings/add", :as => :tagging, :object => Tagging.new(:effect_id => tagging.effect.id), :formats => :html, :handlers => :haml),
      :tag  => render_to_string(:partial => "taggings/remove", :as => :tagging, :object => tagging, :formats => :html, :handlers => :haml)
    }
  end

  def destroy
    tagging = Tagging.find(params[:id])

    tagging.destroy

    render :json => { :message => "Destroyed" }
  end
end
