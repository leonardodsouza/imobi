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

ActiveRecord::Schema.define(version: 20170823104808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anuncios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cidade"
    t.string "bairro"
    t.string "categoria"
    t.string "tipo"
    t.integer "dormitorios"
    t.integer "banheiros"
    t.integer "garagem"
    t.integer "area"
    t.integer "valor"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artigos", force: :cascade do |t|
    t.string "titulo"
    t.text "texto"
    t.string "autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "bairros", force: :cascade do |t|
    t.bigint "cidade_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_bairros_on_cidade_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contatos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.text "mensagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destaques", force: :cascade do |t|
    t.string "titulo"
    t.string "legenda"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "favoritos", force: :cascade do |t|
    t.bigint "imovel_id"
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imovel_id"], name: "index_favoritos_on_imovel_id"
  end

  create_table "fotos", force: :cascade do |t|
    t.string "legenda"
    t.bigint "imovel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at"
    t.index ["imovel_id"], name: "index_fotos_on_imovel_id"
  end

  create_table "imoveis", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "categoria_id"
    t.bigint "tipo_id"
    t.bigint "situacao_id"
    t.bigint "cidade_id"
    t.bigint "bairro_id"
    t.text "descricao"
    t.integer "dormitorios"
    t.integer "banheiros"
    t.integer "garagem"
    t.integer "area"
    t.integer "valor"
    t.integer "visualizacoes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "capa_file_name"
    t.string "capa_content_type"
    t.integer "capa_file_size"
    t.datetime "capa_updated_at"
    t.index ["bairro_id"], name: "index_imoveis_on_bairro_id"
    t.index ["categoria_id"], name: "index_imoveis_on_categoria_id"
    t.index ["cidade_id"], name: "index_imoveis_on_cidade_id"
    t.index ["situacao_id"], name: "index_imoveis_on_situacao_id"
    t.index ["tipo_id"], name: "index_imoveis_on_tipo_id"
    t.index ["usuario_id"], name: "index_imoveis_on_usuario_id"
  end

  create_table "mensagens", force: :cascade do |t|
    t.bigint "imovel_id"
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.text "mensagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imovel_id"], name: "index_mensagens_on_imovel_id"
  end

  create_table "situacoes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "tipo", default: "site"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "visitantes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bairros", "cidades"
  add_foreign_key "favoritos", "imoveis"
  add_foreign_key "fotos", "imoveis"
  add_foreign_key "imoveis", "bairros"
  add_foreign_key "imoveis", "categorias"
  add_foreign_key "imoveis", "cidades"
  add_foreign_key "imoveis", "situacoes"
  add_foreign_key "imoveis", "tipos"
  add_foreign_key "imoveis", "usuarios"
  add_foreign_key "mensagens", "imoveis"
end
