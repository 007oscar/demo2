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

ActiveRecord::Schema.define(version: 20180213020600) do

  create_table "authorities", force: :cascade do |t|
    t.string   "nombre"
    t.string   "puesto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "ciudad"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expedients", force: :cascade do |t|
    t.string   "expediente"
    t.integer  "hojas"
    t.integer  "a_inicial"
    t.integer  "a_final"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "relacionado"
  end

  create_table "experts", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_experts", force: :cascade do |t|
    t.integer  "expert_id"
    t.integer  "registry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["expert_id"], name: "index_has_experts_on_expert_id"
    t.index ["registry_id"], name: "index_has_experts_on_registry_id"
  end

  create_table "has_specialties", force: :cascade do |t|
    t.integer  "expert_id"
    t.integer  "specialty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["expert_id"], name: "index_has_specialties_on_expert_id"
    t.index ["specialty_id"], name: "index_has_specialties_on_specialty_id"
  end

  create_table "registries", force: :cascade do |t|
    t.integer  "consecutivo"
    t.integer  "folio"
    t.integer  "year_folio"
    t.integer  "expedient_id"
    t.integer  "city_id"
    t.integer  "authority_id"
    t.text     "anexos_recibidos"
    t.datetime "fecha_recepcion"
    t.datetime "fecha_entrega"
    t.integer  "result_id"
    t.text     "anexos_entregados"
    t.text     "observaciones"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "num_expediente"
    t.boolean  "detenido"
    t.index ["authority_id"], name: "index_registries_on_authority_id"
    t.index ["city_id"], name: "index_registries_on_city_id"
    t.index ["expedient_id"], name: "index_registries_on_expedient_id"
    t.index ["id", "folio", "year_folio"], name: "index_registries_on_id_and_folio_and_year_folio", unique: true
    t.index ["result_id"], name: "index_registries_on_result_id"
  end

  create_table "results", force: :cascade do |t|
    t.string   "resultado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "especialidad"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "validations", force: :cascade do |t|
    t.integer  "registry_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "expert_id"
    t.index ["expert_id", "registry_id"], name: "index_validations_on_expert_id_and_registry_id", unique: true
    t.index ["expert_id"], name: "index_validations_on_expert_id"
    t.index ["registry_id"], name: "index_validations_on_registry_id"
  end

  create_table "verifications", force: :cascade do |t|
    t.integer  "city_id"
    t.datetime "fecha"
    t.integer  "registry_id"
    t.integer  "expedient_id"
    t.integer  "expert_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "ncluye_expediente"
    t.integer  "coincide_expediente"
    t.integer  "incluye_anexos"
    t.integer  "coinciden_anexos"
    t.integer  "anexos_equipos_de_computo"
    t.integer  "anexos_equipo_de_comunicacion"
    t.integer  "anexos_material_fotografico"
    t.integer  "anexos_disp_alm_elect"
    t.integer  "anexos_componentes_electronicos"
    t.integer  "otros"
    t.integer  "incluye_expediente"
    t.index ["city_id"], name: "index_verifications_on_city_id"
    t.index ["expedient_id"], name: "index_verifications_on_expedient_id"
    t.index ["expert_id"], name: "index_verifications_on_expert_id"
    t.index ["registry_id"], name: "index_verifications_on_registry_id"
  end

end
