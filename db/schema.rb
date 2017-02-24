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

ActiveRecord::Schema.define(version: 20170213124348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adeia_action_permissions", force: :cascade do |t|
    t.integer  "adeia_action_id"
    t.integer  "adeia_permission_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["adeia_action_id"], name: "index_adeia_action_permissions_on_adeia_action_id", using: :btree
    t.index ["adeia_permission_id"], name: "index_adeia_action_permissions_on_adeia_permission_id", using: :btree
  end

  create_table "adeia_actions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adeia_elements", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adeia_group_users", force: :cascade do |t|
    t.integer  "adeia_group_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["adeia_group_id"], name: "index_adeia_group_users_on_adeia_group_id", using: :btree
    t.index ["user_id"], name: "index_adeia_group_users_on_user_id", using: :btree
  end

  create_table "adeia_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adeia_permissions", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "adeia_element_id"
    t.integer  "permission_type"
    t.boolean  "read_right",       default: false
    t.boolean  "create_right",     default: false
    t.boolean  "update_right",     default: false
    t.boolean  "destroy_right",    default: false
    t.integer  "resource_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["adeia_element_id"], name: "index_adeia_permissions_on_adeia_element_id", using: :btree
    t.index ["owner_type", "owner_id"], name: "index_adeia_permissions_on_owner_type_and_owner_id", using: :btree
  end

  create_table "adeia_tokens", force: :cascade do |t|
    t.string   "token"
    t.boolean  "is_valid"
    t.integer  "adeia_permission_id"
    t.date     "exp_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["adeia_permission_id"], name: "index_adeia_tokens_on_adeia_permission_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "remembre_token"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "adeia_action_permissions", "adeia_actions"
  add_foreign_key "adeia_action_permissions", "adeia_permissions"
  add_foreign_key "adeia_group_users", "adeia_groups"
  add_foreign_key "adeia_group_users", "users"
  add_foreign_key "adeia_permissions", "adeia_elements"
  add_foreign_key "adeia_tokens", "adeia_permissions"
end
