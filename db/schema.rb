# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091130183100) do

  create_table "donations", :force => true do |t|
    t.integer  "amount_cents"
    t.string   "name"
    t.string   "email"
    t.boolean  "escape_pod",   :default => true
    t.boolean  "pseudopod",    :default => true
    t.boolean  "podcastle",    :default => true
    t.boolean  "recurring"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "donation_id"
    t.integer  "payment_gross_cents"
    t.integer  "payment_fee_cents"
    t.datetime "paypal_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mc_currency"
    t.integer  "mc_gross_cents"
    t.integer  "mc_fee_cents"
  end

end
