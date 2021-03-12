# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_10_214914) do

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthdate", null: false
    t.string "project", null: false
    t.string "country", null: false
    t.string "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_clients_on_deleted_at"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.date "birthdate", null: false
    t.string "project", null: false
    t.string "country", null: false
    t.string "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
