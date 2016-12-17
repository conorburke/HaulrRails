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

ActiveRecord::Schema.define(version: 20161216223530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer  "driver_id",                             null: false
    t.string   "make",                                  null: false
    t.string   "model",                                 null: false
    t.string   "year",                                  null: false
    t.string   "color",                                 null: false
    t.integer  "approved",                  default: 1
    t.integer  "default_car",               default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "registration_file_name"
    t.string   "registration_content_type"
    t.integer  "registration_file_size"
    t.datetime "registration_updated_at"
    t.string   "insurance_file_name"
    t.string   "insurance_content_type"
    t.integer  "insurance_file_size"
    t.datetime "insurance_updated_at"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "card_number",                 null: false
    t.string   "card_name",                   null: false
    t.string   "expiration_date",             null: false
    t.string   "security_code",               null: false
    t.integer  "approved",        default: 1
    t.integer  "default_card",    default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string   "status",       default: "contacting"
    t.integer  "rider_id",                            null: false
    t.integer  "driver_id"
    t.integer  "rider_score"
    t.integer  "driver_score"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                 null: false
    t.string   "last_name",                                  null: false
    t.string   "email",                                      null: false
    t.string   "password_digest",                            null: false
    t.string   "phone",                                      null: false
    t.string   "zipcode",                                    null: false
    t.string   "status",                    default: "user"
    t.integer  "active_driver",   limit: 2, default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
