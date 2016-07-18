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

ActiveRecord::Schema.define(version: 20160705160723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cours", force: :cascade do |t|
    t.string   "titre"
    t.string   "objectif"
    t.string   "contenu"
    t.string   "type"
    t.string   "decoupage"
    t.string   "evaluation1"
    t.string   "evaluation2"
    t.integer  "coeff"
    t.string   "bibliographie"
    t.integer  "ue_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "cours", ["ue_id"], name: "index_cours_on_ue_id", using: :btree

  create_table "rubriques", force: :cascade do |t|
    t.string   "titre"
    t.string   "contenu"
    t.string   "objectif"
    t.integer  "cour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rubriques", ["cour_id"], name: "index_rubriques_on_cour_id", using: :btree

  create_table "semestres", force: :cascade do |t|
    t.string   "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ues", force: :cascade do |t|
    t.string   "titre"
    t.string   "objectif"
    t.string   "lieu"
    t.string   "prerequis"
    t.integer  "semestre_id"
    t.string   "prof_resp" #temporaire en attendant d'avoir la base de donnée conetenant les users
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ues", ["semestre_id"], name: "index_ues_on_semestre_id", using: :btree

end
