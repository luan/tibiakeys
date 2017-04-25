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

ActiveRecord::Schema.define(version: 20170425053412) do

  create_table "key_assignments", force: :cascade do |t|
    t.string   "key_sequence"
    t.string   "action_type"
    t.string   "action_object"
    t.integer  "key_set_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["key_set_id"], name: "index_key_assignments_on_key_set_id"
  end

  create_table "key_sets", force: :cascade do |t|
    t.string   "name"
    t.integer  "vocation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["vocation_id"], name: "index_key_sets_on_vocation_id"
  end

  create_table "vocations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
