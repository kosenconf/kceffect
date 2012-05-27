Kceffect::Application.routes.draw do
  resources :entries, :only => [:show, :new, :create, :edit, :update]
  resources :users,   :only => [:show]
  resources :events,  :only => [:show, :new, :create, :edit, :update]

  get    "/auth/twitter",          :as => "sign_in"
  get    "/auth/twitter/callback", :to => "sessions#create"
  get    "/auth/failure",          :to => "sessions#failure"
  delete "/sessions",              :to => "sessions#destroy", :as => "sign_out"

  get  "/about", :to => "welcome#about", :as => "about"

  root :to => "welcome#index"
end
