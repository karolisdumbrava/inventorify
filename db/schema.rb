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

ActiveRecord::Schema[7.0].define(version: 2023_08_16_113452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.bigint "variation_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "quantity"
    t.integer "updated_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["variation_id"], name: "index_inventories_on_variation_id"
    t.index ["warehouse_id"], name: "index_inventories_on_warehouse_id"
  end

  create_table "inventory_transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_type"
    t.integer "quantity"
    t.integer "user_id"
    t.integer "inventory_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "restock_alerts", force: :cascade do |t|
    t.integer "threshold"
    t.string "status"
    t.integer "assigned_to_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "inventory_id"
    t.index ["inventory_id"], name: "index_restock_alerts_on_inventory_id"
  end

  create_table "user_activity_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "action"
    t.string "entity"
    t.integer "entity_id"
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_activity_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model"
    t.string "storage"
    t.string "color"
    t.string "connectivity"
    t.string "region"
    t.string "voltage"
    t.decimal "price"
    t.integer "stock_quantity"
    t.string "sku"
    t.string "barcode"
    t.bigint "image_id"
    t.string "size"
    t.index ["product_id"], name: "index_variations_on_product_id"
    t.index ["user_id"], name: "index_variations_on_user_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.bigint "manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity", default: 1000, null: false
    t.integer "used_space", default: 0, null: false
    t.index ["manager_id"], name: "index_warehouses_on_manager_id"
    t.check_constraint "capacity >= 0", name: "chk_warehouses_capacity_nonnegative"
    t.check_constraint "used_space >= 0", name: "chk_warehouses_used_space_nonnegative"
  end

  add_foreign_key "inventories", "users", column: "updated_by_user_id"
  add_foreign_key "inventories", "variations"
  add_foreign_key "inventories", "warehouses"
  add_foreign_key "inventory_transactions", "inventories"
  add_foreign_key "inventory_transactions", "users"
  add_foreign_key "products", "users"
  add_foreign_key "restock_alerts", "inventories"
  add_foreign_key "restock_alerts", "users", column: "assigned_to_user_id"
  add_foreign_key "user_activity_logs", "users"
  add_foreign_key "variations", "products"
  add_foreign_key "variations", "users"
  add_foreign_key "warehouses", "users", column: "manager_id"
end
