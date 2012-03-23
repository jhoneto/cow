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

ActiveRecord::Schema.define(:version => 20120323130302) do

  create_table "accounts", :force => true do |t|
    t.string   "name",       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dentists", :force => true do |t|
    t.integer  "account_id",                :null => false
    t.string   "name",       :limit => 200, :null => false
    t.string   "nickname",   :limit => 30,  :null => false
    t.string   "cpf",        :limit => 20
    t.string   "cro_uf",     :limit => 2,   :null => false
    t.string   "cro_number", :limit => 10,  :null => false
    t.string   "home_phone", :limit => 30
    t.string   "cel_phone",  :limit => 30,  :null => false
    t.string   "work_phone", :limit => 30
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", :force => true do |t|
    t.integer  "account_id",                :null => false
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.string   "name",               :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  add_foreign_key "dentists", "accounts", :name => "dentists_account_id_fk"

  add_foreign_key "specialties", "accounts", :name => "specialties_account_id_fk"

  add_foreign_key "user_roles", "users", :name => "user_roles_user_id_fk"

  add_foreign_key "users", "accounts", :name => "users_account_id_fk"

end
