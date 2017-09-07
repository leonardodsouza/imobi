class CreateMensagens < ActiveRecord::Migration[5.1]
  def change
    create_table :mensagens do |t|
      t.references :imovel, foreign_key: true
      t.string :nome
      t.string :email
      t.string :telefone
      t.text :mensagem

      t.timestamps
    end
  end
end
