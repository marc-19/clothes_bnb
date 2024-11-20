class PagesController < ApplicationController
  def home
    @items = Item.all.order(created_at: :desc) # Ordena por mais recente
  end
end
