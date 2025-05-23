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

ActiveRecord::Schema[8.0].define(version: 2025_03_22_143816) do
  create_table "admin_users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_brands_on_name", unique: true
    t.index ["slug"], name: "index_brands_on_slug", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.integer "brand_id", null: false
    t.string "address"
    t.string "phone_number"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "global_position"
    # (Review)
    # この行は不要ではないですか？ 順番の状態を２つ持つことより、positionを有効に使いましょう！
    # これがたいしたことない機能を必要以上に複雑にしている感じがします。
    t.index ["brand_id"], name: "index_stores_on_brand_id"
    t.index ["name"], name: "index_stores_on_name", unique: true
  end

  add_foreign_key "stores", "brands"
end
