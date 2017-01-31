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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170128195015) do
=======
ActiveRecord::Schema.define(version: 20170128211102) do
>>>>>>> fde95732c2f3ffaa838244f74a9cfca0fb789a46

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "dock_count"
    t.string   "city"
    t.string   "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
=======
  create_table "trips", force: :cascade do |t|
    t.integer  "duration"
    t.string   "start_date"
    t.string   "start_station"
    t.string   "end_date"
    t.string   "end_station"
    t.string   "bike_id"
    t.string   "subscription"
    t.string   "zipcode"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
>>>>>>> fde95732c2f3ffaa838244f74a9cfca0fb789a46
  end

end
