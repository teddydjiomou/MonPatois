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

ActiveRecord::Schema.define(:version => 20160207122056) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "expression_id"
    t.integer  "translation_id"
    t.integer  "discussion_id"
  end

  create_table "discussions", :force => true do |t|
    t.text     "title"
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "expressions", :force => true do |t|
    t.text     "french"
    t.text     "english"
    t.text     "trans"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "language_id"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "origin"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.string   "verify"
  end

  create_table "translations", :force => true do |t|
    t.string   "trans"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "word_id"
    t.integer  "user_id"
    t.integer  "language_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "hashed_password"
    t.string   "mail"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
    t.string   "image"
  end

  create_table "votations", :force => true do |t|
    t.string   "state"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "translation_id"
    t.integer  "expression_id"
    t.integer  "user_id"
  end

  create_table "words", :force => true do |t|
    t.string   "french"
    t.string   "english"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
