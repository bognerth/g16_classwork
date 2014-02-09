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

ActiveRecord::Schema.define(:version => 20140208163711) do

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.integer  "points",      :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "question_id"
  end

  create_table "questions", :force => true do |t|
    t.text     "title"
    t.string   "category"
    t.integer  "testtype_id"
    t.integer  "points",      :default => 5
    t.string   "image"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "studentanswers", :force => true do |t|
    t.integer  "question_id"
    t.integer  "studenttest_id"
    t.integer  "points",         :default => 0
    t.string   "title"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "studenttest_events", :force => true do |t|
    t.string   "state"
    t.integer  "studenttest_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "studenttests", :force => true do |t|
    t.integer  "test_id"
    t.integer  "student_id"
    t.datetime "start"
    t.datetime "end"
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "test_events", :force => true do |t|
    t.string   "state"
    t.integer  "test_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "category"
    t.integer  "testtype_id"
    t.integer  "lecture_id"
    t.integer  "duration"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "testtypes", :force => true do |t|
    t.string   "coursetype"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
