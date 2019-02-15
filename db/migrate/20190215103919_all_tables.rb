class AllTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.timestamps null: false
    end
    create_table :events do |t|
      t.date :event_date
      t.string :location
      t.string :title
      t.string :description
      t.timestamps null: false
    end
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :guest_id
      t.timestamps null: false
    end
    add_index :invitations, :event_id
    add_index :invitations, :guest_id
    add_index :invitations, [:event_id, :guest_id]
    add_column :events, :host_id, :integer, index: true
    rename_column :events, :event_date, :date            
  end
end
