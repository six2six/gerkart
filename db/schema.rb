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

ActiveRecord::Schema.define(:version => 20130102114039) do

  create_table "championships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "championships_drivers", :force => true do |t|
    t.integer "championship_id"
    t.integer "driver_id"
  end

  create_table "drivers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ranking_configurations", :force => true do |t|
    t.integer  "championship_id"
    t.integer  "position"
    t.integer  "points"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "ranking_configurations", ["championship_id"], :name => "index_ranking_configurations_on_championship_id"

  create_table "round_positions", :force => true do |t|
    t.integer  "position"
    t.integer  "driver_id"
    t.time     "total_time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "round_id"
  end

  add_index "round_positions", ["driver_id"], :name => "index_round_positions_on_driver_id"

  create_table "rounds", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "track_id"
    t.integer  "championship_id"
  end

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
