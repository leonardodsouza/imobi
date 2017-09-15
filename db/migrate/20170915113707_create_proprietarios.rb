class CreateProprietarios < ActiveRecord::Migration[5.1]
  def change
    create_table :proprietarios do |t|
      t.references :imovel, foreign_key: true
      t.string :nome
      t.string :telefone
      t.string :email
      t.date :nascimento
      t.string :endereco
      t.string :profissao
      t.string :estado_civil
      t.string :conjuge

      t.timestamps
    end
  end
end
