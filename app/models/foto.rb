class Foto < ApplicationRecord
  belongs_to :imovel
  has_attached_file :img, styles: { medium: "800x800>", thumb: "150x150#" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

end
