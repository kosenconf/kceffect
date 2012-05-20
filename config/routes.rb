Kceffect::Application.routes.draw do
  get "users/show"

  resources :entries, :only => [:show, :new, :create, :edit, :update]
  resources :users,   :only => [:show]

  get    "/auth/twitter",          :as => "sign_in"
  get    "/auth/twitter/callback", :to => "sessions#create"
  get    "/auth/failure",          :to => "sessions#failure"
  delete "/sessions",              :to => "sessions#destroy", :as => "sign_out"

  root :to => "welcome#index"
end
