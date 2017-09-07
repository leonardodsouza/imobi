class Visitante < ApplicationRecord
    validates_presence_of :nome, :email
end
