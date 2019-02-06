class ColumnChanges < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :remember_digest, :string
    add_column :events, :event_date, :date
    add_column :events, :location, :string
    add_column :events, :title, :string
    add_column :events, :description, :string
    add_column :events, :event_id, :integer
    add_column :events, :guest_id, :integer
    add_index :invitations, :event_id
    add_index :invitations, :guest_id
    add_index :invitations, [:event_id, :guest_id]
  end
end
