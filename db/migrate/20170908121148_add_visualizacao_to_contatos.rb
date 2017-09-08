class AddVisualizacaoToContatos < ActiveRecord::Migration[5.1]
  def change
    add_column :contatos, :visualizado, :string , default: 'Não'
  end
end
