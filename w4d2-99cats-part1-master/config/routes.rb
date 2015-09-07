Rails.application.routes.draw do
  resources :cats do
    resources :cat_rental_requests, only: [:index] do
      member do
        post 'approve'
        post 'deny'
      end
    end
  end

  resources :cat_rental_requests, except: [:index]
end
