Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :comments, only: [:create, :destroy]

  resource :session, only: [:new, :create, :destroy]

  resources :goals

end
