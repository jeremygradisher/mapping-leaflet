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

ActiveRecord::Schema[7.0].define(version: 2020_01_03_190118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areaimages", id: :serial, force: :cascade do |t|
    t.string "areaimage"
    t.integer "map_id"
    t.integer "area_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["area_id"], name: "index_areaimages_on_area_id"
    t.index ["map_id"], name: "index_areaimages_on_map_id"
  end

  create_table "areas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.string "status"
    t.string "coords"
    t.integer "square_feet"
    t.string "key"
    t.integer "map_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["map_id"], name: "index_areas_on_map_id"
  end

  create_table "mapimages", id: :serial, force: :cascade do |t|
    t.string "mapimage"
    t.integer "width"
    t.integer "height"
    t.integer "map_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["map_id"], name: "index_mapimages_on_map_id"
  end

  create_table "maps", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_maps_on_user_id"
  end

  create_table "user_avatars", id: :serial, force: :cascade do |t|
    t.string "avatar"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_user_avatars_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "areaimages", "areas"
  add_foreign_key "areaimages", "maps"
  add_foreign_key "areas", "maps"
  add_foreign_key "mapimages", "maps"
  add_foreign_key "maps", "users"
  add_foreign_key "user_avatars", "users"
end
