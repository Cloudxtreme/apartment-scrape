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

ActiveRecord::Schema.define(:version => 20101219032133) do

  create_table "apartments", :force => true do |t|
    t.string   "title"
    t.decimal  "price"
    t.string   "bedrooms"
    t.string   "link"
    t.datetime "posted_at"
    t.integer  "floor_space"
    t.boolean  "cats"
    t.decimal  "cats_deposit"
    t.decimal  "cats_rent"
    t.boolean  "parking"
    t.decimal  "parking_rent"
    t.boolean  "laundry"
    t.text     "pros"
    t.text     "cons"
    t.text     "other"
    t.string   "address"
    t.string   "city_state_zip"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "score"
    t.boolean  "ignore",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apartments", ["ignore"], :name => "index_apartments_on_ignore"
  add_index "apartments", ["latitude", "longitude"], :name => "index_apartments_on_latitude_and_longitude"
  add_index "apartments", ["link"], :name => "index_apartments_on_link", :unique => true
  add_index "apartments", ["posted_at"], :name => "index_apartments_on_posted_at"
  add_index "apartments", ["price"], :name => "index_apartments_on_price"

end
