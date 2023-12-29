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

ActiveRecord::Schema.define(version: 2023_12_26_032511) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "law_office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["law_office_id"], name: "index_favorites_on_law_office_id"
    t.index ["user_id", "law_office_id"], name: "index_favorites_on_user_id_and_law_office_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "law_offices", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "office_name"
    t.string "representative_lawyer_name"
    t.string "postal_code"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "phone_number"
    t.string "business_hours"
    t.text "office_url"
    t.string "focus"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "review"
    t.text "user_id"
    t.text "law_office_id"
    t.float "star"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "law_offices"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "users", column: "user_id"
  add_foreign_key "reviews", "law_offices", column: "law_office_id"
end
