Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show, :destroy] do
    resources :bookings, only: [:create]
    post 'book', to: 'bookings#create', as: :book
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:create]
  end

  # basically we will use the items show to display the reviews and we nest the
  # reviews to booking, but just need the create because we will also use the show
  # of items. So in items show we will do the new and show of bookings

  resources :users, only: [] do
    member do
      get :profile
      get :dashboard
    end
  end
end
