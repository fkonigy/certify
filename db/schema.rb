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

ActiveRecord::Schema.define(version: 20171022185532) do

  create_table "cas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.integer "ca_id"
    t.string "subject"
    t.string "issuer"
    t.integer "serial_number"
    t.date "not_before"
    t.date "not_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "keys"
    t.string "cert_pem"
    t.index ["ca_id"], name: "index_certificates_on_ca_id"
  end

end
