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

ActiveRecord::Schema.define(version: 20160830202648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cours", force: :cascade do |t|
    t.string   "titre"
    t.string   "objectif"
    t.string   "contenu"
    t.string   "genre"
    t.string   "decoupage"
    t.string   "evaluation1"
    t.string   "evaluation2"
    t.float    "coeff"
    t.integer  "ects"
    t.string   "bibliographie"
    t.integer  "ue_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cours", ["ue_id"], name: "index_cours_on_ue_id", using: :btree

  create_table "others", force: :cascade do |t|
    t.string   "value"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semestres", force: :cascade do |t|
    t.string   "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year_id"
  end

  add_index "semestres", ["year_id"], name: "index_semestres_on_year_id", using: :btree

  create_table "ues", force: :cascade do |t|
    t.string   "titre"
    t.string   "objectif"
    t.string   "lieu"
    t.string   "prerequis"
    t.integer  "ects_c"
    t.integer  "semestre_id"
    t.string   "prof_resp"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "acronyme"
  end

  add_index "ues", ["semestre_id"], name: "index_ues_on_semestre_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.string   "value"
    t.boolean  "copy"
    t.integer  "copy_from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "semestres", "years"
end
