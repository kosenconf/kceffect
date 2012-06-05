Kceffect::Application.routes.draw do
  resources :events,        :only => [:index, :show, :new, :create, :edit, :update]
  resources :contributions, :only => [:create, :update]
  resources :tags,          :only => [:show]
  resources :taggings,      :only => [:create, :destroy]
  resources :favorites,     :only => [:create, :destroy]

  resources :effects,       :only => [:show, :new, :create, :edit, :update] do
    get "/tags/edit", :on => :member, :to => "effects#edit_tags"
  end

  resources :users,         :only => [:show] do
    get "/effects",   :on => :member, :to => "users#effects"
    get "/favorites", :on => :member, :to => "users#favorites"
  end

  get    "/auth/twitter",          :as => "sign_in"
  get    "/auth/twitter/callback", :to => "sessions#create"
  get    "/auth/failure",          :to => "sessions#failure"
  delete "/sessions",              :to => "sessions#destroy", :as => "sign_out"

  get  "/about", :to => "welcome#about", :as => "about"

  root :to => "welcome#index"
end
