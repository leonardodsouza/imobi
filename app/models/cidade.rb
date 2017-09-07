class Cidade < ApplicationRecord
  has_many :bairros, inverse_of: :cidade
  accepts_nested_attributes_for :bairros, reject_if: proc { |attributes| attributes[:nome].blank? }
  
end
