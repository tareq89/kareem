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

ActiveRecord::Schema.define(version: 20150915043900) do

  create_table "company_accounts", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.boolean  "buyer"
    t.boolean  "seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_accounts", force: :cascade do |t|
    t.string   "category_spend"
    t.integer  "amount"
    t.string   "note"
    t.string   "to_whome"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "date"
    t.string   "account_type"
    t.string   "css_class"
    t.string   "from_whom"
    t.string   "receipt_no"
    t.boolean  "is_debit"
  end

  create_table "transaction_product_lists", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "total_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transections", force: :cascade do |t|
    t.string   "transaction_no"
    t.integer  "company_account_id"
    t.integer  "transaction_type_id"
    t.integer  "transaction_product_list_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
