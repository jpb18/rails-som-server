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

ActiveRecord::Schema[7.0].define(version: 2023_05_15_084805) do
  create_table "maps", force: :cascade do |t|
    t.integer "feature_number"
    t.integer "width"
    t.integer "height"
    t.json "map_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "serialized_map"
    t.integer "epochs", default: 1
    t.float "learning_rate", default: 1.0
    t.float "sigma", default: 1.0
    t.integer "max_iter", default: 3000
  end

  create_table "sample_data_entries", force: :cascade do |t|
    t.string "label"
    t.json "value"
    t.integer "map_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_sample_data_entries_on_map_id"
  end

  add_foreign_key "sample_data_entries", "maps"
end
