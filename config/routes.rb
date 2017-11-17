Rails.application.routes.draw do

  namespace :api do
    resources :businesses, only: [:index, :create, :show, :update]
  end

end
