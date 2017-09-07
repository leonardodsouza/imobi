class AddAttachmentCapaToImoveis < ActiveRecord::Migration[5.1]
  def self.up
    change_table :imoveis do |t|
      t.attachment :capa
    end
  end

  def self.down
    remove_attachment :imoveis, :capa
  end
end
