class CreateEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_date, :date
    add_column :events, :location, :string
    add_column :events, :title, :string
    add_column :events, :description, :string
  end
end
