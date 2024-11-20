class UsersController < ApplicationController
  before_action :set_user, only: [:profile, :dashboard]

  def profile
    # Lógica para carregar informações do perfil do usuário
  end

  def dashboard
    @user = current_user
    @user_items = @user.items
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
