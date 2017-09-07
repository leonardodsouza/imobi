class CreateCidades < ActiveRecord::Migration[5.1]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.string :estado

      t.timestamps
    end
  end
  def self.up
    Cidade.create(:nome => 'Sanra Rosa', :estado => 'RS')
  end
end
