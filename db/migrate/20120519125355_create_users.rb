class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,          :null => false
      t.string :icon_url,      :null => false
      t.string :profile
      t.string :twitter_id,    :null => false
      t.string :access_token,  :null => false
      t.string :access_secret, :null => false

      t.timestamps
    end

    add_index :users, :name,       :unique => true
    add_index :users, :twitter_id, :unique => true
  end
end
