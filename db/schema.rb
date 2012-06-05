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

ActiveRecord::Schema.define(:version => 20120605025802) do

  create_table "contributions", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "event_id",                      :null => false
    t.boolean  "attendee",   :default => false
    t.boolean  "staff",      :default => false
    t.boolean  "talker",     :default => false
    t.boolean  "dorar",      :default => false
    t.boolean  "watcher",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "contributions", ["event_id"], :name => "index_contributions_on_event_id"
  add_index "contributions", ["user_id", "event_id"], :name => "index_contributions_on_user_id_and_event_id", :unique => true
  add_index "contributions", ["user_id"], :name => "index_contributions_on_user_id"

  create_table "effects", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.string   "url",         :null => false
    t.string   "comment"
    t.datetime "effected_at", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "effects", ["user_id"], :name => "index_effects_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "label",                                :null => false
    t.string   "name",                                 :null => false
    t.string   "description"
    t.string   "url"
    t.integer  "turnout",               :default => 0, :null => false
    t.string   "place"
    t.string   "address"
    t.datetime "start_at",                             :null => false
    t.datetime "end_at",                               :null => false
    t.string   "cover_url"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "cover_original_url"
    t.string   "cover_original_author"
  end

  add_index "events", ["end_at"], :name => "index_events_on_end_at"
  add_index "events", ["label"], :name => "index_events_on_label", :unique => true
  add_index "events", ["start_at"], :name => "index_events_on_start_at"

  create_table "favorites", :force => true do |t|
    t.integer  "effect_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["effect_id", "user_id"], :name => "index_favorites_on_effect_id_and_user_id", :unique => true
  add_index "favorites", ["effect_id"], :name => "index_favorites_on_effect_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "effect_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["effect_id"], :name => "index_taggings_on_effect_id"
  add_index "taggings", ["tag_id", "effect_id"], :name => "index_taggings_on_tag_id_and_effect_id", :unique => true
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["user_id"], :name => "index_taggings_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["category"], :name => "index_tags_on_category"
  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

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
