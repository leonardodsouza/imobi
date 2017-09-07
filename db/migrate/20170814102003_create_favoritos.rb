class CreateFavoritos < ActiveRecord::Migration[5.1]
  def change
    create_table :favoritos do |t|
      t.references :imovel, foreign_key: true
      t.string :nome
      t.string :email

      t.timestamps
    end
  end
end
