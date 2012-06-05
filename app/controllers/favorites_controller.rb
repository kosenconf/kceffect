class FavoritesController < ApplicationController
  before_filter :require_sign_in, :only => [:create, :destroy]

  def create
    effect   = Effect.find(params[:effect])
    favorite = Favorite.create(:effect_id => effect.id, :user_id => current_user.id)

    render :json => {
      :html => render_to_string(:partial => "favorites/unfav", :as => :favorite, :object => favorite, :formats => :html, :handlers => :haml),
      :icon => render_to_string(:partial => "users/cube", :as => :user, :object => current_user, :formats => :html, :handlers => :haml)
    }
  end

  def destroy
    favorite = Favorite.find(params[:id])

    unless favorite.user == current_user
      render "public/403", :status => 403
      return
    end

    effect = favorite.effect
    favorite.destroy

    render :json => {
      :html => render_to_string(:partial => "favorites/fav", :as => :effect, :object => effect, :formats => :html, :handlers => :haml)
    }
  end
end
