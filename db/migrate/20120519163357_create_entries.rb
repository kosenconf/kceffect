class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id, :null => false
      t.string  :url,     :null => false
      t.string  :comment

      t.timestamps
    end

    add_index :entries, :user_id
  end
end
