class CreateFotos < ActiveRecord::Migration[5.1]
  def change
    create_table :fotos do |t|
      t.string :legenda
      t.references :imovel, foreign_key: true

      t.timestamps
    end
  end
end
