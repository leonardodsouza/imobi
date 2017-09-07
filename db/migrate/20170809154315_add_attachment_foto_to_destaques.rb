class AddAttachmentFotoToDestaques < ActiveRecord::Migration[5.1]
  def self.up
    change_table :destaques do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :destaques, :foto
  end
end
