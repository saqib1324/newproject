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

ActiveRecord::Schema.define(version: 20160610010519) do

  create_table "coaching_sessions", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.boolean  "status",                default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "extra_variables", force: :cascade do |t|
    t.string   "voucher_no", limit: 255
    t.string   "deadline",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "fee_vouchers", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "voucher_no",       limit: 255
    t.string   "tracking_id",      limit: 255
    t.string   "total_amount",     limit: 255
    t.string   "status",           limit: 255
    t.string   "payment_deadline", limit: 255
    t.string   "mobile_number",    limit: 255
    t.string   "phone_number",     limit: 255
    t.string   "email",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "letters", force: :cascade do |t|
    t.text     "boarder_letter_text",     limit: 16777215
    t.text     "day_scholar_letter_text", limit: 16777215
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "students", primary_key: "tracking_id", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "father_name",        limit: 255
    t.string   "session",            limit: 255
    t.string   "stream",             limit: 255
    t.string   "m_o_level_stream",   limit: 255
    t.string   "graduation_year",    limit: 255
    t.float    "matric_percentage",  limit: 24
    t.string   "o_level_grades",     limit: 255
    t.string   "DOB",                limit: 255
    t.string   "gender",             limit: 255
    t.string   "secondary_tracking", limit: 255
    t.string   "address1",           limit: 255
    t.string   "address2",           limit: 255
    t.string   "address3",           limit: 255
    t.string   "city",               limit: 255
    t.string   "district",           limit: 255
    t.string   "province",           limit: 255
    t.string   "mobile_number",      limit: 255
    t.string   "phone_number",       limit: 255
    t.integer  "monthly_income",     limit: 4
    t.string   "income_range",       limit: 255
    t.boolean  "boarder"
    t.string   "email",              limit: 255
    t.string   "username",           limit: 255
    t.string   "password_digest",    limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "trackings", primary_key: "tracking_id", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "accepted",               default: false
    t.boolean  "downloaded"
    t.string   "session",    limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "undertaking_texts", force: :cascade do |t|
    t.text     "display_text", limit: 65535
    t.string   "session",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "undertakings", primary_key: "tracking_id", force: :cascade do |t|
    t.boolean  "status",                        default: false
    t.boolean  "admin_status"
    t.string   "file_name",    limit: 255,      default: "null"
    t.binary   "data",         limit: 16777215
    t.string   "mime_type",    limit: 255,      default: "null"
    t.string   "via",          limit: 255
    t.string   "session",      limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "role",                   limit: 255, default: "", null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voucher_mappings", primary_key: "voucher_no", force: :cascade do |t|
    t.string   "tracking_id", limit: 255
    t.string   "session",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "voucher_nos", force: :cascade do |t|
    t.string   "voucher_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
