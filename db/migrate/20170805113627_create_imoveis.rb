class CreateImoveis < ActiveRecord::Migration[5.1]
  def change
    create_table :imoveis do |t|
      t.references :usuario, foreign_key: true
      t.references :categoria, foreign_key: true
      t.references :tipo, foreign_key: true
      t.references :situacao, foreign_key: true
      t.references :cidade, foreign_key: true
      t.references :bairro, foreign_key: true
      t.text :descricao
      t.integer :dormitorios
      t.integer :banheiros
      t.integer :garagem
      t.integer :area
      t.integer :valor
      t.integer :visualizacoes

      t.timestamps
    end
  end
end
