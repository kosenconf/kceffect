class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :label,       :null => false
      t.string   :name,        :null => false
      t.string   :description
      t.string   :url
      t.integer  :turnout,     :null => false, :default => 0
      t.string   :place
      t.string   :address
      t.datetime :start_at,    :null => false
      t.datetime :end_at,      :null => false
      t.string   :cover_url

      t.timestamps
    end

    add_index :events, :label,    :unique => true
    add_index :events, :start_at
    add_index :events, :end_at
  end
end
