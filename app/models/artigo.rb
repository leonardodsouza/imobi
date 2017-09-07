class Artigo < ApplicationRecord
    validates_presence_of :titulo, :texto, :autor
    has_attached_file :foto, styles: { medium: "600x600>", lista: "240X200#", thumb: "145x145#" }
    validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end
