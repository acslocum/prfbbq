# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101011044506) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "event_date"
    t.string   "ticket_url"
    t.boolean  "tickets_available", :default => true
    t.boolean  "is_published"
  end

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bbq_id"
    t.date     "play_date"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "sort_order"
  end

  create_table "bbqs", :force => true do |t|
    t.string   "title"
    t.date     "event_date"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
    t.boolean  "is_published"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
