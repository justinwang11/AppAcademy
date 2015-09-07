Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :sessions, only: [:new, :create, :destroy]

  resources :subs

  resources :posts, except: [:index] do
    member do
      post :upvote
      post :downvote
    end
  end

  resources :comments, only: [:show, :create] do
    member do
      post :upvote
      post :downvote
    end
  end

  root "subs#index"
end
