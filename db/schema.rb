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

ActiveRecord::Schema.define(version: 20160509095144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "house_number"
    t.string   "street_name"
    t.string   "city_name"
    t.string   "mandal_name"
    t.string   "district_name"
    t.string   "state_name"
    t.string   "country_name"
    t.string   "pin_code"
    t.string   "school_name"
    t.string   "college_name"
    t.string   "degree_name"
    t.string   "d_college_name"
    t.string   "pg_name"
    t.string   "pg_college_name"
    t.string   "higher_qualification"
    t.text     "brief_details"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "candidate_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "nick_name"
    t.date     "date_of_birth"
    t.integer  "age"
    t.string   "sex"
    t.integer  "family_members_count"
    t.string   "father"
    t.string   "mother"
    t.string   "brother"
    t.string   "sister"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.string   "email"
    t.string   "password"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "candidate_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["candidate_id"], name: "index_messages_on_candidate_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  add_foreign_key "messages", "candidates"
  add_foreign_key "messages", "conversations"
end
