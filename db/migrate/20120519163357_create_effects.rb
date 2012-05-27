class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.integer  :user_id,     :null => false
      t.string   :url,         :null => false
      t.string   :comment
      t.datetime :effected_at, :null => false

      t.timestamps
    end

    add_index :effects, :user_id
  end
end
