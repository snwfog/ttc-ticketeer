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

ActiveRecord::Schema.define(version: 20151218022833) do

  create_table "ticket_types", force: :cascade do |t|
    t.decimal "price",                       precision: 10
    t.string  "name",            limit: 255
    t.string  "resource_key",    limit: 255
    t.string  "warning",         limit: 255
    t.string  "type_uuid",       limit: 255
    t.integer "type_identifier", limit: 4
  end

  add_index "ticket_types", ["type_uuid"], name: "ticket_types_type_uuid", unique: true, using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "ticket_type_id",   limit: 4
    t.string   "uuid",             limit: 255
    t.datetime "activated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "issue_to_user_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "user_app_id", limit: 255
  end

  add_index "users", ["user_app_id"], name: "uix_users_user_app_id", unique: true, using: :btree

end
