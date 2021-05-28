Rails.application.routes.draw do
  root 'links#index'
  resources :links, only: [:create, :index, :new, :show] do
    resource :upvote, only: :create
    resource :downvote, only: :create 
  end
end

