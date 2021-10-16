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

ActiveRecord::Schema.define(version: 2021_10_07_083509) do

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

  create_table "invoice_receivables", force: :cascade do |t|
    t.date "payment_date"
    t.date "accounting_date"
    t.decimal "amount_paid"
    t.decimal "discount_amount"
    t.decimal "interest_amount"
    t.decimal "addition_amount"
    t.decimal "total_amount"
    t.string "notary_expenses"
    t.string "protest_expenses"
    t.decimal "amount_paid_chart_of_accounts"
    t.decimal "discount_chart_of_accounts"
    t.string "interest_chart_of_account"
    t.string "addition_chart_of_accounts"
    t.string "plan_of_accounts_expenses_notary_public"
    t.string "plan_of_accounts_expenditures_protest"
    t.string "history"
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
    t.string "code"
    t.bigint "account_plan_id", null: false
    t.bigint "cost_center_id", null: false
    t.string "story"
    t.bigint "bill_id", null: false
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_plan_id"], name: "index_rateios_on_account_plan_id"
    t.index ["bill_id"], name: "index_rateios_on_bill_id"
    t.index ["cost_center_id"], name: "index_rateios_on_cost_center_id"
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
  add_foreign_key "rateios", "account_plans"
  add_foreign_key "rateios", "bills"
  add_foreign_key "rateios", "cost_centers"
  add_foreign_key "installments", "account_banks"
  add_foreign_key "installments", "bills"
  add_foreign_key "installments", "type_charges"
end
