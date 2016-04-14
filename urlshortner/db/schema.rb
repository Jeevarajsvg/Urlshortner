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

ActiveRecord::Schema.define(version: 20160414174324) do

  create_table "shorl_urls", force: :cascade do |t|
    t.string   "original_url", limit: 255
    t.string   "shorty",       limit: 255
    t.integer  "user_id",      limit: 4
    t.integer  "visits_count", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "short_urls", force: :cascade do |t|
    t.string   "original_url", limit: 255
    t.string   "shorty",       limit: 255
    t.integer  "user_id",      limit: 4
    t.integer  "visits_count", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "short_visits", force: :cascade do |t|
    t.integer  "short_url_id",         limit: 4
    t.integer  "visitor_ip",           limit: 4
    t.string   "visitor_city",         limit: 255
    t.string   "visitor_state",        limit: 255
    t.string   "visitor_country_iso2", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "api_token",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
