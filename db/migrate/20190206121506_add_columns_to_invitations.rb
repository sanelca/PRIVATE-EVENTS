class AddColumnsToInvitations < ActiveRecord::Migration
  def change
    add_index :invitations, :event_id
    add_index :invitations, :guest_id
  end
end
