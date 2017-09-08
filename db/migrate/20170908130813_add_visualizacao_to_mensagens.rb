class AddVisualizacaoToMensagens < ActiveRecord::Migration[5.1]
  def change
    add_column :mensagens, :visualizado, :string
  end
end
