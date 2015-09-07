Rails.application.routes.draw do

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]
  resources :bands
  resources :albums, except: [:index]
  resources :tracks, except: [:index]

end
