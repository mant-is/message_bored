Rails.application.routes.draw do
  resources :links, only: [:create, :index, :new, :show] do
    resource :upvote, only: :create
    resource :downvote, only: :create 
  end

  get "/new", to: "new_links#index", as: "new_links"

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
  root 'links#index'
end

