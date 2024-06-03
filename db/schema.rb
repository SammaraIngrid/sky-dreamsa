# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_29_185231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code", null: false
    t.string "country", null: false
    t.string "street", null: false
    t.string "number", default: "0"
    t.string "neighborhood", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "document", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.date "birth_date", null: false
    t.string "gender", null: false
    t.string "passport", null: false
    t.string "nationality", null: false
    t.string "image"
    t.boolean "status", default: true
    t.bigint "created_by_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["created_by_id"], name: "index_clients_on_created_by_id"
  end

  create_table "destinies", force: :cascade do |t|
    t.string "name"
    t.bigint "addresses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addresses_id"], name: "index_destinies_on_addresses_id"
  end

  create_table "flights", force: :cascade do |t|
    t.decimal "value"
    t.datetime "schedule"
    t.integer "duration"
    t.bigint "origin_id"
    t.bigint "destiny_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destiny_id"], name: "index_flights_on_destiny_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.decimal "value"
    t.string "category"
    t.integer "day"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_hotels_on_address_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.bigint "addresses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addresses_id"], name: "index_origins_on_addresses_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "transfer_id"
    t.bigint "flight_id"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["flight_id"], name: "index_services_on_flight_id"
    t.index ["hotel_id"], name: "index_services_on_hotel_id"
    t.index ["transfer_id"], name: "index_services_on_transfer_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "value"
    t.datetime "schedule"
    t.integer "duration"
    t.bigint "origin_id"
    t.bigint "destiny_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destiny_id"], name: "index_transfers_on_destiny_id"
    t.index ["origin_id"], name: "index_transfers_on_origin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "addresses"
  add_foreign_key "clients", "users", column: "created_by_id"
  add_foreign_key "flights", "destinies"
  add_foreign_key "flights", "origins"
  add_foreign_key "hotels", "addresses"
  add_foreign_key "services", "clients"
  add_foreign_key "services", "flights"
  add_foreign_key "services", "hotels"
  add_foreign_key "services", "transfers"
  add_foreign_key "transfers", "destinies"
  add_foreign_key "transfers", "origins"
end
