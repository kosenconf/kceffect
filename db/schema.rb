# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120520090811) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "url",        :null => false
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "label",                      :null => false
    t.string   "name",                       :null => false
    t.string   "description"
    t.string   "url"
    t.integer  "turnout",     :default => 0, :null => false
    t.string   "place"
    t.string   "address"
    t.datetime "start_at",                   :null => false
    t.datetime "end_at",                     :null => false
    t.string   "cover_url"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "events", ["end_at"], :name => "index_events_on_end_at"
  add_index "events", ["label"], :name => "index_events_on_label", :unique => true
  add_index "events", ["start_at"], :name => "index_events_on_start_at"

  create_table "users", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "icon_url",      :null => false
    t.string   "profile"
    t.string   "twitter_id",    :null => false
    t.string   "access_token",  :null => false
    t.string   "access_secret", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["twitter_id"], :name => "index_users_on_twitter_id", :unique => true

end
