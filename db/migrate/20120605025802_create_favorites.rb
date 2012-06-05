class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :effect_id, :null => false
      t.integer :user_id,   :null => false

      t.timestamps
    end

    add_index :favorites, :effect_id
    add_index :favorites, :user_id
    add_index :favorites, [:effect_id, :user_id], :unique => true
  end
end
