class RenameEventDateInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :event_date, :date
  end
end
