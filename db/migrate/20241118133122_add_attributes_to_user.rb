class AddAttributesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_seller, :boolean, default: false
    add_column :users, :address, :string
  end
end
