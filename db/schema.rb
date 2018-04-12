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

ActiveRecord::Schema.define(version: 20180412214121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "levels", force: :cascade do |t|
    t.integer "floor_level"
    t.integer "parking_lot_1", default: 0
    t.integer "parking_lot_2", default: 0
    t.integer "parking_lot_3", default: 0
    t.integer "parking_lot_4", default: 0
    t.integer "parking_lot_5", default: 0
    t.integer "parking_lot_6", default: 0
    t.integer "parking_lot_7", default: 0
    t.integer "parking_lot_8", default: 0
    t.integer "parking_lot_9", default: 0
    t.integer "parking_lot_10", default: 0
    t.json "special_parking", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
