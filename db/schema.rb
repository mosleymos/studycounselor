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

ActiveRecord::Schema.define(version: 20151121094708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "administrators", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "appointments", force: true do |t|
    t.integer  "student_id"
    t.integer  "counselor_id"
    t.string   "telephone"
    t.datetime "date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["counselor_id"], name: "index_appointments_on_counselor_id", using: :btree
  add_index "appointments", ["student_id"], name: "index_appointments_on_student_id", using: :btree

  create_table "cards", force: true do |t|
    t.datetime "appointment_datetime"
    t.text     "comment_text"
    t.text     "avaibility_text"
    t.integer  "student_id"
    t.integer  "counselor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "future_study_choice"
    t.string   "careers_interest"
  end

  add_index "cards", ["counselor_id"], name: "index_cards_on_counselor_id", using: :btree
  add_index "cards", ["student_id"], name: "index_cards_on_student_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.string   "research_name"
    t.string   "first_letter"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizings", force: true do |t|
    t.integer  "category_id"
    t.integer  "categorizable_id"
    t.string   "categorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizings", ["categorizable_id", "categorizable_type"], name: "index_categorizings_on_categorizable_id_and_categorizable_type", using: :btree
  add_index "categorizings", ["category_id"], name: "index_categorizings_on_category_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counselors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "telephone"
    t.string   "slug"
    t.text     "address"
    t.boolean  "approved_by_administrator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "general_description"
    t.text     "school_description"
    t.text     "jobs_description"
    t.text     "availibility_description"
    t.text     "image_url"
    t.text     "linkedin_url"
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.hstore   "social_url"
    t.string   "school_name"
    t.string   "moto"
    t.string   "study_domain"
    t.string   "high_school"
    t.string   "looking_job"
    t.string   "bac_mention"
    t.string   "study_level"
    t.string   "study_financing"
    t.hstore   "availability"
    t.string   "lundi"
    t.string   "mardi"
    t.string   "mercredi"
    t.string   "jeudi"
    t.string   "vendredi"
    t.string   "samedi"
    t.string   "dimanche"
    t.string   "bac_type"
  end

  add_index "counselors", ["email"], name: "index_counselors_on_email", unique: true, using: :btree
  add_index "counselors", ["reset_password_token"], name: "index_counselors_on_reset_password_token", unique: true, using: :btree

  create_table "jobbings", force: true do |t|
    t.integer  "job_id"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobbings", ["job_id"], name: "index_jobbings_on_job_id", using: :btree
  add_index "jobbings", ["program_id"], name: "index_jobbings_on_program_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image_url"
    t.string   "first_letter"
    t.string   "research_name"
    t.string   "slug"
    t.string   "mean_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["name"], name: "index_jobs_on_name", using: :btree

  create_table "leads", force: true do |t|
    t.integer  "card_id"
    t.integer  "program_id"
    t.text     "comment"
    t.boolean  "recall"
    t.boolean  "document"
    t.boolean  "approved_by_school"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leads", ["card_id"], name: "index_leads_on_card_id", using: :btree
  add_index "leads", ["program_id"], name: "index_leads_on_program_id", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "program_url"
    t.text     "image_url"
    t.integer  "school_id"
    t.string   "equivalent_year"
    t.string   "program_duration"
    t.text     "admission_description"
    t.string   "first_letter"
    t.string   "research_name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diploma"
    t.string   "campus"
    t.integer  "price"
    t.text     "perspectives_description"
    t.text     "pedagogy_description"
    t.text     "fees"
  end

  add_index "programs", ["name"], name: "index_programs_on_name", using: :btree
  add_index "programs", ["school_id"], name: "index_programs_on_school_id", using: :btree

  create_table "questionings", force: true do |t|
    t.integer  "question_id"
    t.integer  "counselor_id"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questionings", ["counselor_id"], name: "index_questionings_on_counselor_id", using: :btree
  add_index "questionings", ["question_id"], name: "index_questionings_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.text     "research_name"
    t.string   "first_letter"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rankings", force: true do |t|
    t.integer  "student_id"
    t.integer  "counselor_id"
    t.text     "comment"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["counselor_id"], name: "index_rankings_on_counselor_id", using: :btree
  add_index "rankings", ["student_id"], name: "index_rankings_on_student_id", using: :btree

  create_table "representatives", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "representatives", ["email"], name: "index_representatives_on_email", unique: true, using: :btree
  add_index "representatives", ["reset_password_token"], name: "index_representatives_on_reset_password_token", unique: true, using: :btree

  create_table "schools", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.string   "image_url"
    t.string   "school_url"
    t.string   "first_letter"
    t.text     "research_name"
    t.text     "slug"
    t.text     "goals"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.text     "moto"
    t.string   "telephone"
    t.string   "contact_mail"
    t.boolean  "has_admin_account"
    t.text     "statistics_text"
    t.text     "twitter_url"
    t.text     "facebook_url"
    t.text     "youtube_url"
    t.text     "linkedin_url"
    t.string   "student_number"
    t.text     "photos_videos"
    t.text     "fees"
    t.string   "email"
    t.integer  "representative_id"
  end

  add_index "schools", ["representative_id"], name: "index_schools_on_representative_id", using: :btree

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.integer  "age"
    t.string   "mail"
    t.string   "city"
    t.string   "etablissement"
    t.text     "previous_studies"
    t.string   "filieres"
    t.integer  "mean_grade"
    t.string   "father_profession"
    t.string   "mother_profession"
    t.text     "general_comment"
    t.string   "first_letter"
    t.string   "research_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "study_geo_location"
    t.text     "student_info_channel"
    t.string   "schools"
  end

  create_table "studyings", force: true do |t|
    t.integer  "counselor_id"
    t.integer  "school_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studyings", ["counselor_id"], name: "index_studyings_on_counselor_id", using: :btree
  add_index "studyings", ["school_id"], name: "index_studyings_on_school_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "image_url"
    t.string   "first_letter"
    t.string   "research_name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

end
