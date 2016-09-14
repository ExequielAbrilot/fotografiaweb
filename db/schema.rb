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

ActiveRecord::Schema.define(version: 20160619230812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "compromissos", force: :cascade do |t|
    t.string   "titulo"
    t.string   "texto"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "fotografo_id"
    t.integer  "servicio_id"
    t.integer  "user_id"
    t.datetime "horas_duracion"
    t.datetime "hora_inicio"
  end

  create_table "defaults", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fotografos", force: :cascade do |t|
    t.string   "nombre_pila"
    t.string   "apellido"
    t.integer  "telefono"
    t.date     "fecha_nacimiento"
    t.integer  "rut"
    t.string   "email"
    t.string   "comentarios"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "precio_servicio"
    t.string   "dato_facebook"
    t.string   "dato_instagram"
    t.string   "dato_twitter"
  end

  create_table "servicios", force: :cascade do |t|
    t.string   "nombre"
    t.text     "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "precio"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "role",                   default: "Cliente"
    t.string   "primer_nombre"
    t.string   "segundo_nombre"
    t.string   "apellido"
    t.string   "is_female"
    t.date     "datos_nacimiento"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "compromissos", "fotografos", on_delete: :cascade
  add_foreign_key "compromissos", "servicios", on_delete: :cascade
  add_foreign_key "compromissos", "users", on_delete: :cascade
end
