# frozen_string_literal: true

class AddProfilesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zipcode, :string
    add_column :users, :address, :string
    add_column :users, :biography, :text
  end
end
