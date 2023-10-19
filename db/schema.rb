# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_19_102148) do
  create_table "academics", force: :cascade do |t|
    t.text "syllabus"
    t.integer "att_in_percent"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_academics_on_user_id"
  end

  create_table "accountings", force: :cascade do |t|
    t.integer "total_value"
    t.integer "current_due"
    t.integer "credited"
    t.string "other_details"
    t.integer "other_charges"
    t.string "details"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accountings_on_user_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "discipline"
    t.integer "pincode"
    t.string "city"
    t.integer "fee"
  end

  create_table "colleges_features", id: false, force: :cascade do |t|
    t.integer "college_id", null: false
    t.integer "feature_id", null: false
    t.index ["college_id", "feature_id"], name: "index_colleges_features_on_college_id_and_feature_id"
  end

  create_table "colleges_news_letters", id: false, force: :cascade do |t|
    t.integer "college_id", null: false
    t.integer "news_letter_id", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.integer "course_code"
    t.integer "course_credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities_hostels", id: false, force: :cascade do |t|
    t.integer "facility_id", null: false
    t.integer "hostel_id", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_schools", id: false, force: :cascade do |t|
    t.integer "feature_id", null: false
    t.integer "school_id", null: false
    t.index ["feature_id", "school_id"], name: "index_features_schools_on_feature_id_and_school_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_galleries_on_imageable"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.string "residential_type"
    t.string "residable_type"
    t.integer "residable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee"
    t.index ["residable_type", "residable_id"], name: "index_hostels_on_residable"
  end

  create_table "hostels_news_letters", id: false, force: :cascade do |t|
    t.integer "hostel_id", null: false
    t.integer "news_letter_id", null: false
  end

  create_table "news_letters", force: :cascade do |t|
    t.string "title"
    t.integer "post_no"
    t.string "brief_info"
    t.text "detailed_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_letters_schools", id: false, force: :cascade do |t|
    t.integer "news_letter_id", null: false
    t.integer "school_id", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "amount"
    t.integer "status"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "amount"
    t.string "status"
    t.string "payment_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.string "medium"
    t.string "affiliation"
    t.text "address"
    t.string "city"
    t.integer "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.string "discipline"
    t.string "subject"
    t.string "standard"
    t.string "institution_type"
    t.boolean "approved", default: false
    t.integer "contact"
    t.integer "role_id", null: false
    t.integer "college_id"
    t.integer "school_id"
    t.integer "hostel_id"
    t.index ["college_id"], name: "index_users_on_college_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hostel_id"], name: "index_users_on_hostel_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "academics", "users"
  add_foreign_key "accountings", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "orders", "users"
  add_foreign_key "receipts", "users"
  add_foreign_key "users", "colleges"
  add_foreign_key "users", "hostels"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "schools"
end
