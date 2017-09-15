class AddAreaToImoveis < ActiveRecord::Migration[5.1]
  def change
    add_column :imoveis, :area_construida, :integer
  end
end
