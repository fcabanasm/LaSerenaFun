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

ActiveRecord::Schema.define(version: 20151207172707) do

  create_table "apartments", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.integer  "user_id",       limit: 4
    t.integer  "rooms",         limit: 4,     default: 0
    t.integer  "bathrooms",     limit: 4,     default: 0
    t.integer  "pernightPrice", limit: 4
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "state",         limit: 255,   default: "unpublished_unrented"
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.string   "address",       limit: 255
    t.integer  "category_id",   limit: 4
    t.boolean  "wifi",                        default: false
    t.boolean  "tv",                          default: false
    t.boolean  "radio",                       default: false
    t.boolean  "tvcable",                     default: false
    t.boolean  "parking",                     default: false
    t.integer  "reservePrice",  limit: 4
    t.integer  "visits_count",  limit: 4,     default: 0
  end

  add_index "apartments", ["category_id"], name: "index_apartments_on_category_id", using: :btree
  add_index "apartments", ["user_id"], name: "index_apartments_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "apartment_id", limit: 4
    t.text     "body",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["apartment_id"], name: "index_comments_on_apartment_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "apartment_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "state",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "payments", ["apartment_id"], name: "index_payments_on_apartment_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "description",        limit: 255
    t.string   "image",              limit: 255
    t.integer  "cover",              limit: 4
    t.integer  "apartment_id",       limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["apartment_id"], name: "index_pictures_on_apartment_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.string   "token",      limit: 255
    t.string   "payerid",    limit: 255
    t.integer  "user_id",    limit: 4
    t.decimal  "total",                  precision: 10, scale: 3
    t.string   "answer",     limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "ip_address", limit: 255
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "name",                   limit: 255
    t.string   "rut",                    limit: 255
    t.string   "address",                limit: 255
    t.string   "phone_number",           limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "admin"
    t.boolean  "owner"
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "apartments", "categories"
  add_foreign_key "apartments", "users"
  add_foreign_key "comments", "apartments"
  add_foreign_key "comments", "users"
  add_foreign_key "payments", "apartments"
  add_foreign_key "payments", "users"
  add_foreign_key "pictures", "apartments"
  add_foreign_key "transactions", "users"
end
