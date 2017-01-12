Rails.application.routes.draw do


  namespace :api do
  get 'user/index'
  end

  resources :user, :shallow => true do
    resources :lists do
      resources :items
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create, :update]
    end

    resources :items, only: [:destroy]
   end
end
