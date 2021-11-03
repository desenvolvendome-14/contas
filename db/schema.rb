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

ActiveRecord::Schema.define(version: 2021_11_03_212120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_banks", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "account_plans", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer "bill_type"
    t.integer "type_invoice"
    t.string "invoice"
    t.float "commission"
    t.date "issuance_date"
    t.date "scanning_date"
    t.string "description"
    t.float "invoice_value"
    t.float "increase"
    t.float "discount"
    t.float "net_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "salesman_id"
    t.bigint "company_id", null: false
    t.bigint "account_plan_id"
    t.bigint "cost_center_id"
    t.bigint "participant_id"
    t.index ["account_plan_id"], name: "index_bills_on_account_plan_id"
    t.index ["company_id"], name: "index_bills_on_company_id"
    t.index ["cost_center_id"], name: "index_bills_on_cost_center_id"
    t.index ["participant_id"], name: "index_bills_on_participant_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.integer "person_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rateios", force: :cascade do |t|
    t.decimal "value_rateio"
    t.text "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reason_bearishes", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_charges", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bills", "account_plans"
  add_foreign_key "bills", "companies"
  add_foreign_key "bills", "cost_centers"
  add_foreign_key "bills", "participants"
  add_foreign_key "bills", "participants", column: "salesman_id"
end
