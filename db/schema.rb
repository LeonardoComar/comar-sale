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

ActiveRecord::Schema.define(version: 2021_12_13_165046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.string "zipcode"
    t.string "neighborhood"
    t.string "complement"
    t.string "reference_point"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "matriculation_code"
    t.string "password"
    t.decimal "credit", precision: 5, scale: 2
    t.string "status"
    t.bigint "unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_id"], name: "index_customers_on_unit_id"
  end

  create_table "human_resources", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "cpf"
    t.string "phone"
    t.string "matriculation_code"
    t.string "status"
    t.date "birth_date"
    t.bigint "unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_id"], name: "index_human_resources_on_unit_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "internal_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions_roles", force: :cascade do |t|
    t.bigint "permission_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "status"
    t.string "phone"
    t.string "unit_type"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_units_on_address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id", null: false
    t.bigint "human_resource_id", null: false
    t.string "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["human_resource_id"], name: "index_users_on_human_resource_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "customers", "units"
  add_foreign_key "human_resources", "units"
  add_foreign_key "permissions_roles", "permissions"
  add_foreign_key "permissions_roles", "roles"
  add_foreign_key "units", "addresses"
  add_foreign_key "users", "human_resources"
  add_foreign_key "users", "roles"
end
