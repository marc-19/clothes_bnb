Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :create, :show] do
    resources :bookings, only: [:create]
    post 'book', to: 'bookings#create', as: :book
  end
  # Rotas para perfil e dashboard
  resources :users do
    member do
      get :profile # Exibe o perfil do usuário
      get :dashboard# Exibe o dashboard do usuário
    end
  end
end
