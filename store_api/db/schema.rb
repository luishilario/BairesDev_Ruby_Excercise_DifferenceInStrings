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

ActiveRecord::Schema.define(version: 2021_03_05_224244) do

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.string "description", limit: 250
    t.string "author", limit: 30
    t.string "editor"
    t.string "category", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_books_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.string "description", limit: 250
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "platform_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_games_on_company_id"
    t.index ["platform_id"], name: "index_games_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "companies"
  add_foreign_key "games", "companies"
  add_foreign_key "games", "platforms"
end
