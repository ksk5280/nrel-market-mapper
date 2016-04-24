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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160423211955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "counties", ["state_id"], name: "index_counties_on_state_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "abbr"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "geojson"
  end

  create_table "summaries", force: :cascade do |t|
    t.string   "year"
    t.decimal  "avg_cost"
    t.decimal  "capacity"
    t.integer  "total_installs"
    t.integer  "state_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "summaries", ["state_id"], name: "index_summaries_on_state_id", using: :btree

  create_table "zipcodes", force: :cascade do |t|
    t.string   "number"
    t.integer  "total_installs"
    t.integer  "county_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "zipcodes", ["county_id"], name: "index_zipcodes_on_county_id", using: :btree

  add_foreign_key "counties", "states"
  add_foreign_key "summaries", "states"
  add_foreign_key "zipcodes", "counties"
end
