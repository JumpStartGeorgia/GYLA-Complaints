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

ActiveRecord::Schema.define(:version => 20120928143922) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cec_form_children", :force => true do |t|
    t.text     "cesko_complaint_author_sender"
    t.string   "responder_district_election_commission"
    t.datetime "cesko_complaint_registration_time"
    t.text     "veiolation_essence"
    t.text     "request"
    t.datetime "cesko_complaint_discation_time"
    t.boolean  "where_parties_invited_on_descation"
    t.text     "complaint_discation_people"
    t.boolean  "cesko_meeting_all_commission_members"
    t.boolean  "cesko_meeting_report"
    t.boolean  "cesko_meeting_testimony_research"
    t.text     "extra_comment"
    t.text     "cesko_desision"
    t.boolean  "was_desision_grounded"
    t.boolean  "was_complained_the_desision"
    t.boolean  "was_web_announcement_made_on_complaint"
    t.text     "if_not_then_precincts_and_reasons"
    t.text     "describe_other_extra_environments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cec_form_id"
    t.boolean  "was_complaint_satisfied"
  end

  create_table "cec_forms", :force => true do |t|
    t.boolean  "cesko_summary_report_input"
    t.text     "if_not_precinct_name_and_num"
    t.boolean  "cesko_election_summary_after_one_day"
    t.text     "if_not_after_one_day_precinct_name_num"
    t.boolean  "cesko_report_web_translition"
    t.text     "if_not_the_reason"
    t.boolean  "cesko_summary_process_transparently"
    t.text     "description_how_transparent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cesko_list_observer"
    t.string   "monitoring_time"
    t.string   "organization_name"
  end

  create_table "complaint_additional_infos", :force => true do |t|
    t.integer  "complaint_id"
    t.string   "level"
    t.integer  "status_id"
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

  create_table "complaint_files", :force => true do |t|
    t.integer  "complaint_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_type"
    t.string   "additional_info_id"
  end

  add_index "complaint_files", ["complaint_id"], :name => "index_complaint_files_on_complaint_id"

  create_table "complaints", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
    t.string   "original_level"
    t.string   "observer_name"
    t.text     "observer_address"
    t.string   "observer_phone"
    t.integer  "election_district_name"
    t.integer  "election_precinct_number"
    t.integer  "category_id"
    t.integer  "violation_type_id"
    t.datetime "violation_time"
    t.text     "witness"
    t.text     "violator_info"
    t.text     "other_info"
    t.text     "description"
  end

  create_table "dec_form_children", :force => true do |t|
    t.string   "complaint_author_presentator"
    t.string   "response_precinct_commission"
    t.datetime "complaint_district_registration_time"
    t.text     "violation_essence"
    t.text     "request"
    t.datetime "complaint_disscusion_time"
    t.boolean  "where_parties_invited_to_disscusion"
    t.text     "disscusion_people"
    t.boolean  "all_commission_memebers_attended"
    t.boolean  "report_while_meeting"
    t.boolean  "testimonies_investigation_evaluation"
    t.text     "extra_comments"
    t.text     "dec_desision"
    t.boolean  "was_desision_grounded"
    t.boolean  "does_pary_plans_to_complaint"
    t.text     "describe_other_extra_env"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dec_form_id"
    t.boolean  "complaint_satisfied"
  end

  create_table "dec_forms", :force => true do |t|
    t.integer  "dec_total_complaints"
    t.boolean  "dec_journal_registration_yes_no"
    t.boolean  "ped_entered_with_law"
    t.boolean  "lonked_election_lists"
    t.boolean  "complaints"
    t.boolean  "get_send_act"
    t.text     "describe_extra_env"
    t.integer  "was_canonical_procedures_done"
    t.boolean  "where_props_filled"
    t.boolean  "precinct_results_canel_proc"
    t.boolean  "commission_summary_report_publicity"
    t.text     "extra_env_describe"
    t.boolean  "summed_up_or_not_summary_reports"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "district_name_id"
    t.string   "observer_name"
    t.string   "monitoring_time"
    t.string   "organisation_name"
  end

  create_table "district_id_names", :force => true do |t|
    t.integer  "district_id"
    t.string   "district_name"
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
    t.boolean  "registered_or_not_complaint"
    t.datetime "registration_time"
    t.boolean  "do_you_give_complaint_to_higher_commission"
    t.text     "violation_essence"
    t.text     "request"
    t.boolean  "was_complaint_setisfied"
    t.text     "other_extra_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
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
