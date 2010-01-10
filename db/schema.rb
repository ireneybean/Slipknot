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

ActiveRecord::Schema.define(:version => 20091226052100) do

  create_table "allocations", :force => true do |t|
    t.integer  "donation_id"
    t.integer  "podcast_id"
    t.integer  "amount_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.integer  "amount_cents"
    t.string   "name"
    t.string   "email"
    t.boolean  "pseudopod",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",         :default => "OneTimeDonation", :null => false
    t.string   "comment"
  end

  create_table "payments", :force => true do |t|
    t.integer  "donation_id"
    t.integer  "payment_gross_cents"
    t.integer  "payment_fee_cents"
    t.datetime "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mc_currency"
    t.integer  "mc_gross_cents"
    t.integer  "mc_fee_cents"
    t.integer  "item_number"
    t.string   "payment_status"
    t.string   "txn_type"
    t.string   "txn_id"
    t.string   "payment_type"
  end

  create_table "podcasts", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
