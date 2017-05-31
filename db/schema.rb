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

ActiveRecord::Schema.define(version: 20170531194102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.text     "results"
    t.text     "conclusion"
    t.integer  "proposal_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["proposal_id"], name: "index_experiments_on_proposal_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title",           null: false
    t.text     "summary",         null: false
    t.string   "hypothesis",      null: false
    t.string   "status",          null: false
    t.integer  "requestor_id"
    t.integer  "experimentor_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["requestor_id"], name: "index_proposals_on_requestor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "experiments", "proposals"
end
