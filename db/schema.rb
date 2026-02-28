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

ActiveRecord::Schema[8.1].define(version: 2026_02_28_222442) do
  create_table "cargos", force: :cascade do |t|
    t.string "nome_cargo"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.integer "cargo_id"
    t.string "cpf"
    t.string "encrypted_password", default: "", null: false
    t.string "nome"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "telefone"
    t.index ["cargo_id"], name: "index_funcionarios_on_cargo_id"
    t.index ["reset_password_token"], name: "index_funcionarios_on_reset_password_token", unique: true
  end

  create_table "itens_da_vendas", force: :cascade do |t|
    t.decimal "precounitario"
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.integer "venda_id", null: false
    t.index ["produto_id"], name: "index_itens_da_vendas_on_produto_id"
    t.index ["venda_id"], name: "index_itens_da_vendas_on_venda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.decimal "preco"
    t.string "tipo"
  end

  create_table "vendas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.datetime "data_da_compra"
    t.integer "funcionario_id", null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
    t.index ["funcionario_id"], name: "index_vendas_on_funcionario_id"
  end

  add_foreign_key "funcionarios", "cargos"
  add_foreign_key "itens_da_vendas", "produtos"
  add_foreign_key "itens_da_vendas", "vendas"
  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "funcionarios"
end
