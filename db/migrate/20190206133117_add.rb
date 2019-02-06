class Add < ActiveRecord::Migration
  def change
    add_column :invitations, :event_id, :integer
    add_column :invitations, :guest_id, :integer
  end
end
