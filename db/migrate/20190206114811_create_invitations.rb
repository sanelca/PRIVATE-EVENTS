class CreateInvitations < ActiveRecord::Migration
  def change
    
    add_column :events, :event_id, :integer
    add_column :events, :guest_id, :integer
    add_index :invitations, :event_id
    add_index :invitations, :guest_id
    add_index :invitations, [:event_id, :guest_id]
  end
end
