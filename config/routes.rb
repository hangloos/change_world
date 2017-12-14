Rails.application.routes.draw do

  namespace :api do
    resources :businesses, only: [:index, :create, :show, :update, :destroy] do
      resources :items, only: [:index, :create, :destroy]
    end
  end

end
