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


ActiveRecord::Schema.define(version: 2018_10_04_214514) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "property_type_id"
    t.integer "region_id"
    t.string "rent_purpose"
    t.integer "area"
    t.integer "room_quantity"
    t.boolean "accessibility"
    t.boolean "allow_pets"
    t.boolean "allow_smokers"
    t.integer "maximum_guests"
    t.integer "minimum_rent"
    t.integer "maximum_rent"
    t.decimal "daily_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "realtor_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
    t.index ["realtor_id"], name: "index_properties_on_realtor_id"
    t.index ["region_id"], name: "index_properties_on_region_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.decimal "total_amount"
    t.integer "total_guests"
    t.text "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "property_id"
    t.integer "status", default: 0
    t.index ["property_id"], name: "index_proposals_on_property_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "realtors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_realtors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_realtors_on_reset_password_token", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "document"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
