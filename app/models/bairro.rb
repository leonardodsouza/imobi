class Bairro < ApplicationRecord
  belongs_to :cidade, inverse_of: :bairros
end
