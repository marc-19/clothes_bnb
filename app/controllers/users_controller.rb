class UsersController < ApplicationController
  before_action :set_user, only: [:profile, :dashboard]

  def profile
    # Lógica para carregar informações do perfil do usuário
  end

  def dashboard
    @created_items = current_user.items
    @rented_items = current_user.rentals.includes(:item) # Certifique-se que rentals está associado
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
