# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_20_063558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "name", null: false
    t.string "zip", limit: 7, null: false
    t.string "prefecture", limit: 8, null: false
    t.string "city", limit: 24, null: false
    t.string "address", limit: 255, null: false
    t.string "tel"
    t.string "manager_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["task_id"], name: "index_agents_on_task_id"
  end

  create_table "claims", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.datetime "troubled_at", null: false
    t.integer "category", limit: 2, null: false
    t.text "content", null: false
    t.text "support_content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_claims_on_task_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "name", limit: 255
    t.string "zip", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.integer "room_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture"
    t.index ["task_id"], name: "index_customers_on_task_id"
  end

  create_table "front_managers", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.integer "manager"
    t.string "tel"
    t.string "support_at"
    t.string "office_hours"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_front_managers_on_task_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.serial "invoice_no", null: false
    t.date "issued_on", null: false
    t.date "support_at", null: false
    t.bigint "tax_included", default: 0
    t.string "bank", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_invoices_on_task_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name", null: false
    t.string "sales", default: "0"
    t.string "worker"
    t.string "contact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.integer "area", default: 0, null: false
    t.string "kanji", null: false
    t.string "romaji", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.string "name", null: false
    t.string "zip", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_properties_on_task_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "task_partners", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "partner_id", null: false
    t.datetime "created_at", null: false
    t.index ["partner_id"], name: "index_task_partners_on_partner_id"
    t.index ["task_id"], name: "index_task_partners_on_task_id"
  end

  create_table "task_workers", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "worker_id", null: false
    t.datetime "created_at"
    t.index ["task_id"], name: "index_task_workers_on_task_id"
    t.index ["worker_id"], name: "index_task_workers_on_worker_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "dispatch"
    t.text "content"
    t.date "support_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "category"
    t.integer "step"
    t.integer "sales_check"
    t.integer "admin_check"
    t.string "vehicle"
    t.bigint "sales"
    t.integer "confirmation"
    t.bigint "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "task_id"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["task_id"], name: "index_users_on_task_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agents", "tasks"
  add_foreign_key "claims", "tasks"
  add_foreign_key "customers", "tasks"
  add_foreign_key "front_managers", "tasks"
  add_foreign_key "invoices", "tasks"
  add_foreign_key "properties", "tasks"
  add_foreign_key "task_partners", "partners"
  add_foreign_key "task_partners", "tasks"
  add_foreign_key "task_workers", "tasks"
  add_foreign_key "task_workers", "workers"
  add_foreign_key "users", "tasks"
end
