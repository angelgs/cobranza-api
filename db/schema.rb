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

ActiveRecord::Schema.define(version: 20170702074219) do

  create_table "cobradors", force: :cascade do |t|
    t.string "clave", limit: 15
    t.string "nombre", limit: 80
    t.string "zona", limit: 25
    t.string "ruta", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clave"], name: "index_cobradors_on_clave", unique: true
  end

  create_table "cobradors_contratos", id: false, force: :cascade do |t|
    t.integer "contrato_id", null: false
    t.integer "cobrador_id", null: false
    t.index ["cobrador_id", "contrato_id"], name: "index_cobradors_contratos_on_cobrador_id_and_contrato_id"
    t.index ["contrato_id", "cobrador_id"], name: "index_cobradors_contratos_on_contrato_id_and_cobrador_id"
  end

  create_table "cobradors_pagos", id: false, force: :cascade do |t|
    t.integer "cobrador_id", null: false
    t.integer "pago_id", null: false
  end

  create_table "contratos", force: :cascade do |t|
    t.string "numero_contrato", limit: 15
    t.string "numero_cuenta", limit: 15
    t.date "fecha_apertura"
    t.decimal "monto_contrato", precision: 12, scale: 2
    t.decimal "saldo", precision: 12, scale: 2
    t.integer "total_pagos"
    t.integer "pagos_atrasados"
    t.decimal "cargo_intereses", precision: 12, scale: 2
    t.decimal "otros_cargos", precision: 12, scale: 2
    t.string "motivo_otros_cargos", limit: 60
    t.text "aviso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
    t.index ["cliente_id"], name: "index_contratos_on_cliente_id"
    t.index ["fecha_apertura"], name: "index_contratos_on_fecha_apertura"
    t.index ["numero_contrato"], name: "index_contratos_on_numero_contrato", unique: true
    t.index ["numero_cuenta"], name: "index_contratos_on_numero_cuenta", unique: true
  end

  create_table "direccions", force: :cascade do |t|
    t.string "calle", limit: 80
    t.string "numero_exterior", limit: 10
    t.string "numero_interior", limit: 10
    t.string "colonia", limit: 60
    t.string "municipio", limit: 60
    t.string "estado", limit: 60
    t.string "pais", limit: 60
    t.text "referencias"
    t.integer "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_direccions_on_persona_id"
  end

  create_table "link_cliente_referencia", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "referencium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_link_cliente_referencia_on_cliente_id"
    t.index ["referencium_id"], name: "index_link_cliente_referencia_on_referencium_id"
  end

  create_table "pagos", force: :cascade do |t|
    t.integer "contrato_id"
    t.datetime "fecha_pago"
    t.integer "numero_pago"
    t.decimal "monto_pago", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contrato_id"], name: "index_pagos_on_contrato_id"
    t.index ["fecha_pago"], name: "index_pagos_on_fecha_pago"
  end

  create_table "personas", force: :cascade do |t|
    t.string "clave", limit: 15
    t.string "type"
    t.string "primer_nombre", limit: 50
    t.string "segundo_nombre", limit: 50
    t.string "apellido_paterno", limit: 50
    t.string "apellido_materno", limit: 50
    t.string "curp", limit: 17
    t.string "rfc", limit: 13
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "es_aval"
    t.index ["clave"], name: "index_personas_on_clave"
  end

  create_table "productos", force: :cascade do |t|
    t.integer "contrato_id"
    t.integer "cantidad"
    t.string "descripcion", limit: 50
    t.decimal "precio_unitario", precision: 12, scale: 2
    t.decimal "precio_venta", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contrato_id"], name: "index_productos_on_contrato_id"
  end

  create_table "telefonos", force: :cascade do |t|
    t.integer "persona_id"
    t.string "numero_telefono", limit: 15
    t.integer "tipo_telefono"
    t.string "alias", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_telefonos_on_persona_id"
  end

end
