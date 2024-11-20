Rails.application.routes.draw do
  devise_for :users

  # Define a página inicial
  root to: "pages#home"

  # Rotas para items
  resources :items, only: [:new, :create, :show]

  # Rotas para perfil e dashboard
  resources :users, only: [] do
    member do
      get :profile # Exibe o perfil do usuário
      get :dashboard # Exibe o dashboard do usuário
    end
  end
end
