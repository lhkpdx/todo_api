Rails.application.routes.draw do
  resources :user, :shallow => true do
    resources :lists do
      resources :items
    end
  end
end
