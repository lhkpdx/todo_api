Rails.application.routes.draw do
  get 'users/index'

  namespace :api do
  get 'user/index'
  end

  resources :user, :shallow => true do
    resources :lists do
      resources :items
    end
  end

  namespace :api, defaults: { format: :json } do
     resources :users
   end
end
