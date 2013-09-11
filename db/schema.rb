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

ActiveRecord::Schema.define(version: 20130911085508) do

  create_table "aui_test_results", force: true do |t|
    t.text     "raw_results"
    t.string   "letters"
    t.integer  "animal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learning_test_result_id"
  end

  create_table "dol_test_results", force: true do |t|
    t.text     "habits_ranked"
    t.text     "raw_results"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learning_test_result_id"
  end

  create_table "gmi_test_results", force: true do |t|
    t.text     "intelligences_ranked"
    t.text     "raw_results"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learning_test_result_id"
  end

  create_table "learning_test_results", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "dol_test_result_id"
    t.integer  "gmi_test_result_id"
    t.integer  "aui_test_result_id"
    t.integer  "star_test_result_id"
  end

  create_table "star_test_results", force: true do |t|
    t.decimal  "spatial"
    t.decimal  "tactile"
    t.decimal  "auditory"
    t.decimal  "reading"
    t.text     "raw_results"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "learning_test_result_id"
  end

  create_table "students", force: true do |t|
    t.text     "name"
    t.integer  "year"
    t.text     "eq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
