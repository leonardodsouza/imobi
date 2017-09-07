class AddImgToFotos < ActiveRecord::Migration[5.1]
  def up
    add_attachment :fotos, :img
  end

  def down
    remove_attachment :fotos, :img
  end
end
