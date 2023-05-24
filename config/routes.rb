Rails.application.routes.draw do
  resources :restaurants do
    # /restaurants/*
    collection do
      # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
      get :top
    end

    # /restaurants/:id/*
    member do
      get :chef
    end

    # YOU ONLY NEST IF YOU NEED TO KNOW THE ID OF THE PARENT
    resources :reviews, only: %i[ new create ]
  end

  resources :reviews, only: :destroy
end
