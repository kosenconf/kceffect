class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :user_id,  :null => false
      t.integer :event_id, :null => false
      t.boolean :attendee, :default => false
      t.boolean :staff,    :default => false
      t.boolean :talker,   :default => false
      t.boolean :dorar,    :default => false
      t.boolean :watcher,  :default => false

      t.timestamps
    end

    add_index :contributions, :user_id
    add_index :contributions, :event_id
    add_index :contributions, [:user_id, :event_id], :unique => true
  end
end
