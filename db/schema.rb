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

ActiveRecord::Schema.define(:version => 20120504170855) do

  create_table "accounts", :force => true do |t|
    t.string   "name",       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dentist_specialties", :force => true do |t|
    t.integer  "dentist_id",   :null => false
    t.integer  "specialty_id", :null => false
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

  create_table "entries", :force => true do |t|
    t.integer  "financial_account_id",                                                   :null => false
    t.date     "date",                                                                   :null => false
    t.decimal  "value",                :precision => 18, :scale => 2,                    :null => false
    t.integer  "entry_type",                                                             :null => false
    t.boolean  "cancel",                                              :default => false, :null => false
    t.integer  "patient_id"
    t.integer  "estimate_id"
    t.string   "description"
    t.integer  "payment_id",                                                             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estimate_payments", :force => true do |t|
    t.integer  "estimate_id",                                 :null => false
    t.integer  "payment_type",                                :null => false
    t.decimal  "value",        :precision => 18, :scale => 2, :null => false
    t.integer  "quotes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estimate_procedures", :force => true do |t|
    t.integer  "estimate_id",                                 :null => false
    t.integer  "procedure_id",                                :null => false
    t.decimal  "value",        :precision => 18, :scale => 2
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estimates", :force => true do |t|
    t.date     "date",                                                          :null => false
    t.integer  "patient_id",                                                    :null => false
    t.decimal  "total",       :precision => 18, :scale => 2
    t.decimal  "discount",    :precision => 18, :scale => 2
    t.decimal  "final_value", :precision => 18, :scale => 2
    t.decimal  "balance",     :precision => 18, :scale => 2
    t.boolean  "canceled",                                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",                                                    :null => false
  end

  create_table "financial_accounts", :force => true do |t|
    t.string   "name",                            :null => false
    t.integer  "account_id",                      :null => false
    t.boolean  "inactive",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_type",                    :null => false
  end

  create_table "patients", :force => true do |t|
    t.integer  "account_id",                    :null => false
    t.string   "name",           :limit => 200, :null => false
    t.string   "rg",             :limit => 30
    t.string   "rg_orgao",       :limit => 50
    t.string   "cpf",            :limit => 20
    t.date     "date_of_birth"
    t.string   "sex",            :limit => 1
    t.string   "nationality",    :limit => 200
    t.string   "place_of_birth", :limit => 200
    t.string   "marital_status", :limit => 1
    t.string   "occupation",     :limit => 200
    t.string   "home_phone",     :limit => 30
    t.string   "cel_phone",      :limit => 30,  :null => false
    t.string   "work_phone",     :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "account_id",                                                      :null => false
    t.string   "name",                                                            :null => false
    t.integer  "payment_type",                                                    :null => false
    t.boolean  "inactive",                                     :default => false, :null => false
    t.integer  "max_quota"
    t.decimal  "tax",           :precision => 18, :scale => 2
    t.decimal  "discount_card", :precision => 18, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", :force => true do |t|
    t.integer  "account_id",                                                                        :null => false
    t.string   "tuss",               :limit => 20
    t.string   "name",                                                                              :null => false
    t.boolean  "active",                                                          :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                            :precision => 18, :scale => 2
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "account_id",                                     :null => false
    t.integer  "patient_id"
    t.string   "patient_name", :limit => 200,                    :null => false
    t.integer  "dentist_id",                                     :null => false
    t.date     "date",                                           :null => false
    t.time     "time",                                           :null => false
    t.boolean  "fit",                         :default => false, :null => false
    t.integer  "status",                      :default => 1,     :null => false
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",        :limit => 20
    t.boolean  "reminder",                    :default => false, :null => false
  end

  create_table "specialties", :force => true do |t|
    t.integer  "account_id",                :null => false
    t.string   "name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timetables", :force => true do |t|
    t.integer  "dentist_id", :null => false
    t.integer  "day_week",   :null => false
    t.time     "start_time", :null => false
    t.time     "stop_time",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatment_items", :force => true do |t|
    t.integer  "treatment_id", :null => false
    t.integer  "tooth",        :null => false
    t.integer  "procedure_id", :null => false
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", :force => true do |t|
    t.integer  "account_id",  :null => false
    t.integer  "dentist_id",  :null => false
    t.integer  "patient_id",  :null => false
    t.date     "date",        :null => false
    t.integer  "schedule_id"
    t.integer  "estimate_id"
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

  add_foreign_key "dentist_specialties", "dentists", :name => "dentist_specialties_dentist_id_fk"
  add_foreign_key "dentist_specialties", "specialties", :name => "dentist_specialties_specialty_id_fk"

  add_foreign_key "dentists", "accounts", :name => "dentists_account_id_fk"

  add_foreign_key "entries", "financial_accounts", :name => "entries_financial_account_id_fk"
  add_foreign_key "entries", "payments", :name => "entries_payment_id_fk"

  add_foreign_key "estimate_payments", "estimates", :name => "estimate_payments_estimate_id_fk"

  add_foreign_key "estimate_procedures", "estimates", :name => "estimate_procedures_estimate_id_fk"
  add_foreign_key "estimate_procedures", "procedures", :name => "estimate_procedures_procedure_id_fk"

  add_foreign_key "estimates", "accounts", :name => "estimates_account_id_fk"

  add_foreign_key "financial_accounts", "accounts", :name => "financial_accounts_account_id_fk"

  add_foreign_key "patients", "accounts", :name => "patients_account_id_fk"

  add_foreign_key "procedures", "accounts", :name => "procedures_account_id_fk"

  add_foreign_key "schedules", "accounts", :name => "schedules_account_id_fk"
  add_foreign_key "schedules", "dentists", :name => "schedules_dentist_id_fk"
  add_foreign_key "schedules", "patients", :name => "schedules_patient_id_fk"

  add_foreign_key "specialties", "accounts", :name => "specialties_account_id_fk"

  add_foreign_key "timetables", "dentists", :name => "timetables_dentist_id_fk"

  add_foreign_key "treatments", "accounts", :name => "treatments_account_id_fk"
  add_foreign_key "treatments", "dentists", :name => "treatments_dentist_id_fk"
  add_foreign_key "treatments", "estimates", :name => "treatments_estimate_id_fk"
  add_foreign_key "treatments", "patients", :name => "treatments_patient_id_fk"
  add_foreign_key "treatments", "schedules", :name => "treatments_schedule_id_fk"

  add_foreign_key "user_roles", "users", :name => "user_roles_user_id_fk"

  add_foreign_key "users", "accounts", :name => "users_account_id_fk"

end
