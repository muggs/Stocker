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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140111042836) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.string   "email"
    t.string   "contact_number_1"
    t.string   "contact_number_2"
    t.string   "fax_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "contact_type"
  end

  create_table "expenses", :force => true do |t|
    t.string   "expense_type"
    t.date     "expense_date"
    t.string   "description"
    t.string   "vendor_name"
    t.string   "city"
    t.string   "state"
    t.float    "amount"
    t.string   "remarks"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "stock_id"
    t.integer  "piece"
    t.float    "net_weight"
    t.float    "sell_price"
    t.string   "remarks"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.date     "order_date"
    t.string   "remarks"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "due_date"
    t.float    "discount"
    t.string   "order_type"
  end

  create_table "purchase_stocks", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "stock_id"
    t.integer  "piece"
    t.float    "net_weight"
    t.string   "remarks"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "purchases", :force => true do |t|
    t.string   "stone_type"
    t.string   "sub_type"
    t.string   "shape"
    t.integer  "piece"
    t.float    "net_weight"
    t.float    "purchase_price"
    t.float    "length"
    t.float    "breadth"
    t.float    "sarafa_weight"
    t.float    "gross_weight"
    t.float    "discount"
    t.date     "due_date"
    t.string   "remarks"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "contact_id"
  end

  add_index "purchases", ["contact_id"], :name => "index_purchases_on_contact_id"

  create_table "sales", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "contact_id"
    t.integer  "stock_id"
    t.integer  "piece"
    t.float    "net_weight"
    t.float    "sale_price"
    t.float    "discount"
    t.date     "due_date"
    t.string   "remarks"
    t.string   "sale_type"
  end

  add_index "sales", ["contact_id"], :name => "index_sales_on_contact_id"
  add_index "sales", ["stock_id"], :name => "index_sales_on_stock_id"

  create_table "stocks", :force => true do |t|
    t.string   "stone_type"
    t.string   "sub_type"
    t.string   "shape"
    t.integer  "piece"
    t.float    "net_weight"
    t.float    "cost_price"
    t.float    "sell_price"
    t.float    "length"
    t.float    "breadth"
    t.float    "sarafa_weight"
    t.float    "gross_weight"
    t.string   "remarks"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "stock_no"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
