class AddAttachmentFotoToArtigos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :artigos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :artigos, :foto
  end
end
