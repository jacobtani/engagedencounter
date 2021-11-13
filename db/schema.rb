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

ActiveRecord::Schema.define(version: 2021_11_13_110302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", id: :serial, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "surname", null: false
    t.text "address", null: false
    t.string "email", null: false
    t.string "fiance_full_name", null: false
    t.integer "age"
    t.string "phone_number", null: false
    t.string "religion", null: false
    t.string "parish"
    t.string "preferred_event", null: false
    t.string "post_wedding_address", null: false
    t.string "dietary_requirements"
    t.date "wedding_date"
    t.integer "event_id"
    t.string "preferred_name"
    t.index ["event_id"], name: "index_attendees_on_event_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "location", null: false
    t.string "event_date"
    t.date "start_date"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
