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

ActiveRecord::Schema.define(version: 20190707213506) do

  create_table "contractors", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.float  "total_cost"
    t.float  "sub_cost"
    t.string "subcontractors"
    t.string "status"
    t.string "billing_status"
    t.string "contractor_id"
    t.string "subcontractor_id"
  end

  create_table "subcontractors", force: :cascade do |t|
    t.string "name"
    t.string "trade"
    t.string "project_name"
    t.string "status"
    t.string "payment_status"
  end

end
