class RemoveUsuariosIdToImoveis < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:imoveis, :usuario, index: true)
  end
end
