Rails.application.routes.draw do

  namespace :api, :defaults => { :format => :json } do
    resources :boards
    resources :lists
    resources :cards
    resources :todo_items
  end

  root to: "static_pages#root"

end
