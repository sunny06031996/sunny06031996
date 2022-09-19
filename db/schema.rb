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

ActiveRecord::Schema[7.0].define(version: 2022_09_19_121449) do
  create_table "comments", charset: "latin1", force: :cascade do |t|
    t.text "content"
    t.bigint "post_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_comments_on_employee_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "employees", charset: "latin1", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "contact_number"
    t.integer "role"
    t.bigint "teamlead_id"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isdeleted", default: false
    t.index ["teamlead_id"], name: "index_employees_on_teamlead_id"
  end

  create_table "events", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_events_on_commentable"
    t.index ["employee_id"], name: "index_events_on_employee_id"
  end

  create_table "likes", charset: "latin1", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.bigint "likeable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
  end

  create_table "posts", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_posts_on_commentable"
    t.index ["employee_id"], name: "index_posts_on_employee_id"
  end

  add_foreign_key "comments", "employees"
  add_foreign_key "comments", "posts"
  add_foreign_key "employees", "employees", column: "teamlead_id"
  add_foreign_key "events", "employees"
  add_foreign_key "posts", "employees"
end
