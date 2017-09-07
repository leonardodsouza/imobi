class CreateAnuncios < ActiveRecord::Migration[5.1]
  def change
    create_table :anuncios do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cidade
      t.string :bairro
      t.string :categoria
      t.string :tipo
      t.integer :dormitorios
      t.integer :banheiros
      t.integer :garagem
      t.integer :area
      t.integer :valor
      t.text :descricao

      t.timestamps
    end
  end
end
