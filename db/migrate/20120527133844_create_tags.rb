class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name,     :null => false
      t.string :category

      t.timestamps
    end

    add_index :tags, :name,    :unique => true
    add_index :tags, :category
  end
end
