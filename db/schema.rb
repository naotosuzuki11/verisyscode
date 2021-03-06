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

ActiveRecord::Schema.define(version: 2020_01_26_074641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_1_line_1"
    t.string "address_1_line_2"
    t.string "address_1_city"
    t.string "address_1_state"
    t.string "address_1_zip"
    t.string "address_2_line_1"
    t.string "address_2_line_2"
    t.string "address_2_city"
    t.string "address_2_state"
    t.string "address_2_zip"
    t.bigint "vandelay_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vandelay_contact_id"], name: "index_addresses_on_vandelay_contact_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.string "phone_1_number"
    t.string "phone_1_type"
    t.string "phone_2_number"
    t.string "phone_2_type"
    t.string "phone_3_number"
    t.string "phone_3_type"
    t.bigint "vandelay_contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vandelay_contact_id"], name: "index_numbers_on_vandelay_contact_id"
  end

  create_table "vandelay_contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "address_1_line_1"
    t.string "address_1_line_2"
    t.string "address_1_city"
    t.string "address_1_state"
    t.string "address_1_zip"
    t.string "address_2_line_1"
    t.string "address_2_line_2"
    t.string "address_2_city"
    t.string "address_2_state"
    t.string "address_2_zip"
    t.string "phone_1_number"
    t.string "phone_1_type"
    t.string "phone_2_number"
    t.string "phone_2_type"
    t.string "phone_3_number"
    t.string "phone_3_type"
    t.bigint "license_number"
    t.date "last_update_date"
    t.boolean "valid_license", default: true
    t.boolean "duplicate_license", default: true
    t.boolean "merged_record", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "vandelay_contacts"
  add_foreign_key "numbers", "vandelay_contacts"
end
