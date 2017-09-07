class Foto < ApplicationRecord
  belongs_to :imovel
  has_attached_file :img, styles: { medium: "600x600>", thumb: "145x145#" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

end
