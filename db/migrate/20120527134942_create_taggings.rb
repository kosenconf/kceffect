class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id,    :null => false
      t.integer :effect_id, :null => false
      t.integer :user_id,   :null => false

      t.timestamps
    end

    add_index :taggings, :tag_id
    add_index :taggings, :effect_id
    add_index :taggings, [:tag_id, :effect_id], :unique => true
    add_index :taggings, :user_id
  end
end
