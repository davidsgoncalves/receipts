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

ActiveRecord::Schema.define(version: 2019_06_13_015124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "name"
    t.integer "fixed_value_cd"
    t.decimal "value"
    t.integer "type_cd"
    t.integer "installments"
    t.integer "payday_limit"
    t.boolean "require_receipt"
    t.boolean "require_doc"
    t.boolean "late_fine"
    t.text "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid", default: false
    t.date "starts_at"
  end

  create_table "payments", force: :cascade do |t|
    t.boolean "paid", default: false
    t.date "payday"
    t.decimal "estimated_value"
    t.decimal "paid_value"
    t.string "receipt"
    t.string "bill_image"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_payments_on_bill_id"
  end

end
