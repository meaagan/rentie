# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_02_154232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.string "address"
    t.integer "mortgage"
    t.integer "purchase_price"
    t.date "purchase_date"
    t.integer "taxes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_buildings_on_user_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "phone_number"
    t.string "speciality"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "rent_payments", force: :cascade do |t|
    t.date "due_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", default: "pending"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "unit_id"
    t.index ["unit_id"], name: "index_rent_payments_on_unit_id"
    t.index ["user_id"], name: "index_rent_payments_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "status", default: false
    t.string "urgency"
    t.float "expense"
    t.date "start_date"
    t.date "end_date"
    t.bigint "contractor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "building_id"
    t.bigint "unit_id"
    t.string "category"
    t.index ["building_id"], name: "index_tasks_on_building_id"
    t.index ["contractor_id"], name: "index_tasks_on_contractor_id"
    t.index ["unit_id"], name: "index_tasks_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.integer "unit_number"
    t.integer "purchase_price"
    t.string "payment_method"
    t.date "renewal_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "payment_date"
    t.bigint "user_id"
    t.binary "lease"
    t.float "square_meters"
    t.float "bathrooms"
    t.float "bedrooms"
    t.integer "rent_amount_cents", default: 0, null: false
    t.index ["building_id"], name: "index_units_on_building_id"
    t.index ["user_id"], name: "index_units_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "renter", default: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buildings", "users"
  add_foreign_key "contractors", "users"
  add_foreign_key "rent_payments", "units"
  add_foreign_key "rent_payments", "users"
  add_foreign_key "tasks", "contractors"
  add_foreign_key "units", "buildings"
  add_foreign_key "units", "users"
end
