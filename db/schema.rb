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

ActiveRecord::Schema.define(version: 20160908130302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "line3"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "country_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", unique: true, using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment_body"
    t.integer  "trail_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["trail_id"], name: "index_comments_on_trail_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "trail_id"
    t.text     "note_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trail_id"], name: "index_notes_on_trail_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "avatar_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.string   "gpx_file_url"
    t.string   "map_thumbnail_url"
    t.string   "elevation_thumbnail_url"
    t.string   "province"
    t.string   "country_code"
    t.string   "region_type"
    t.string   "agency"
    t.string   "website"
    t.string   "distance_value"
    t.string   "distance_unit"
    t.integer  "distance_type",           default: 0, null: false
    t.integer  "publish_status",          default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_foreign_key "comments", "trails"
  add_foreign_key "notes", "trails"
end
