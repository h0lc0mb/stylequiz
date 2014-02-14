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

ActiveRecord::Schema.define(:version => 20140214015201) do

  create_table "questions", :force => true do |t|
    t.integer  "test_id"
    t.integer  "item_a"
    t.integer  "item_b"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "win"
  end

  add_index "questions", ["test_id", "created_at"], :name => "index_questions_on_test_id_and_created_at"

  create_table "tagpairs", :force => true do |t|
    t.integer  "item"
    t.string   "tag_a"
    t.string   "tag_b"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tagpairs", ["item"], :name => "index_tagpairs_on_item"

  create_table "tests", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "started"
  end

end
