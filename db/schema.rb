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

ActiveRecord::Schema[7.1].define(version: 2025_06_28_101029) do
  create_table "active_admin_comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.bigint "role_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_admin_users_on_role_id"
    t.index ["username"], name: "index_admin_users_on_username", unique: true
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "payroll_cost_center"
    t.string "location"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_departments_on_code", unique: true
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "designations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "department_id"
    t.bigint "job_level_id"
    t.string "payroll_cost_center"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id", "name"], name: "index_designations_on_department_id_and_name", unique: true
    t.index ["department_id"], name: "index_designations_on_department_id"
    t.index ["job_level_id"], name: "index_designations_on_job_level_id"
  end

  create_table "emergency_contacts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "relationship"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_emergency_contacts_on_employee_id"
  end

  create_table "employee_families", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "full_name"
    t.string "relationship"
    t.date "birth_date"
    t.bigint "gender_id"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.index ["employee_id"], name: "index_employee_families_on_employee_id"
    t.index ["gender_id"], name: "index_employee_families_on_gender_id"
  end

  create_table "employee_grades", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "job_level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_level_id"], name: "index_employee_grades_on_job_level_id"
    t.index ["name"], name: "index_employee_grades_on_name", unique: true
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name", null: false
    t.bigint "gender_id", null: false
    t.date "birth_date"
    t.boolean "is_deleted", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_joining"
    t.string "employment_type"
    t.string "job_title"
    t.bigint "designation_id", null: false
    t.string "marital_status"
    t.bigint "department_id"
    t.decimal "initial_salary", precision: 12, scale: 2
    t.string "mobile_number"
    t.string "email_address"
    t.string "company_email_address"
    t.string "current_address"
    t.string "permament_address"
    t.bigint "assigned_shift_id"
    t.string "attendance_device_id"
    t.boolean "is_overtime_eligible", default: false, null: false
    t.bigint "leave_approver_id"
    t.index ["assigned_shift_id"], name: "index_employees_on_assigned_shift_id"
    t.index ["date_of_joining"], name: "index_employees_on_date_of_joining"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["designation_id"], name: "index_employees_on_designation_id"
    t.index ["first_name"], name: "index_employees_on_first_name"
    t.index ["gender_id"], name: "index_employees_on_gender_id"
    t.index ["is_deleted"], name: "index_employees_on_is_deleted"
    t.index ["job_title"], name: "index_employees_on_job_title"
    t.index ["last_name"], name: "index_employees_on_last_name"
    t.index ["leave_approver_id"], name: "index_employees_on_leave_approver_id"
    t.index ["middle_name"], name: "index_employees_on_middle_name"
  end

  create_table "genders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genders_on_name", unique: true
  end

  create_table "holidays", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "holiday_type"
    t.text "description"
    t.boolean "is_recurring", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_type"], name: "index_holidays_on_holiday_type"
    t.index ["is_recurring"], name: "index_holidays_on_is_recurring"
    t.index ["name"], name: "index_holidays_on_name"
  end

  create_table "job_levels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "position_name", null: false
    t.string "position_code", null: false
    t.integer "level_rank", default: 0, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_code"], name: "index_job_levels_on_position_code", unique: true
    t.index ["position_name"], name: "index_job_levels_on_position_name", unique: true
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "shifts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.time "time_in"
    t.time "time_out"
    t.time "break_start_time"
    t.time "break_end_time"
    t.integer "grace_period"
    t.json "working_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shifts_on_name", unique: true
  end

  create_table "violations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "severity_level"
    t.string "default_sanction"
    t.integer "number_of_offenses_strike"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_violations_on_name", unique: true
    t.index ["status"], name: "index_violations_on_status"
  end

  add_foreign_key "admin_users", "roles"
  add_foreign_key "designations", "departments"
  add_foreign_key "designations", "job_levels"
  add_foreign_key "emergency_contacts", "employees"
  add_foreign_key "employee_families", "employees"
  add_foreign_key "employee_families", "genders"
  add_foreign_key "employee_grades", "job_levels"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "employees", column: "leave_approver_id"
  add_foreign_key "employees", "genders"
  add_foreign_key "employees", "shifts", column: "assigned_shift_id"
end
