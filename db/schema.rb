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

ActiveRecord::Schema.define(:version => 20120920135457) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complaints", :force => true do |t|
    t.string   "observer_name"
    t.text     "observer_address"
    t.string   "observer_phone"
    t.integer  "election_district_name"
    t.integer  "election_precinct_number"
    t.integer  "category"
    t.integer  "violation_type"
    t.datetime "violation_time"
    t.text     "witness"
    t.text     "violator_info"
    t.text     "other_info"
    t.string   "status"
    t.string   "complaint_author_name"
    t.string   "complaint_author_phone"
    t.text     "court_name"
    t.datetime "complaint_writing_time"
    t.text     "request_in_complaint"
    t.datetime "response_date"
    t.text     "complaint_result"
    t.text     "additional_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "election_district_names", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "election_precinct_numbers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pec_forms", :force => true do |t|
    t.integer  "election_district_number"
    t.integer  "election_precinct_number"
    t.string   "observer_name"
    t.integer  "current_number_of_complaints"
    t.text     "complaint_author"
    t.datetime "registration_time"
    t.boolean  "do_you_give_complaint_to_higher_commission"
    t.text     "violation_essence"
    t.text     "request"
    t.boolean  "was_complaint_setisfied"
    t.text     "other_extra_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "registered_or_not_complaint"
  end

  create_table "statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "role",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "violation_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
