# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100721142144) do

  create_table "elements", :force => true do |t|
    t.integer  "template_id"
    t.integer  "position"
    t.integer  "elem_id"
    t.string   "elem_type"
    t.integer  "column_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", :force => true do |t|
    t.string   "title"
    t.string   "menu_name"
    t.string   "shortcut"
    t.integer  "node_id"
    t.boolean  "displayed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", :force => true do |t|
    t.string   "template_name"
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_elems", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
