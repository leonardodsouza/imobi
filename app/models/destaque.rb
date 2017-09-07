class Destaque < ApplicationRecord
    has_attached_file :foto, styles: { medium: "600x600>", thumb: "145x145#" }
    validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end
