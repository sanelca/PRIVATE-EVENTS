class CreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :
    add_column :users, :remember_digest, :string
  end
end
