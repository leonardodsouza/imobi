class Imovel < ApplicationRecord
  belongs_to :categoria
  belongs_to :tipo
  belongs_to :situacao
  belongs_to :cidade
  belongs_to :bairro
  has_many :fotos, :dependent => :destroy
  has_many :mensagens, :dependent => :destroy
  validates_presence_of :usuario_id, :categoria_id, :tipo_id, :situacao_id, :cidade_id, :bairro_id, :descricao, :capa, :area, :valor
  has_attached_file :capa, styles: { medium: "600x600>", lista: "240X200#", thumb: "145x145#" }
  validates_attachment_content_type :capa, content_type: /\Aimage\/.*\z/


  scope :tipo, -> (parameter) { where("tipo_id = ?", parameter )}     
  scope :categoria, -> (parameter)  { where("categoria_id = ?", parameter)}
  scope :cidade, -> (parameter)  { where("cidade_id = ?", parameter)}
  scope :bairro, -> (parameter)  { where("bairro_id = ?", parameter)}
  scope :dormitorios, -> (parameter)  { where("dormitorios = ?", parameter)}
  scope :banheiros, -> (parameter)  { where("banheiros = ?", parameter)}
  scope :garagem, -> (parameter)  { where("garagem = ?", parameter)}
  scope :preco_minimo, -> (parameter)  { where("valor >= ?", parameter)}
  scope :preco_maximo, -> (parameter)  { where("valor <= ?", parameter)}
 
  def self.search(parameters)
    consulta = all
    parameters.each do |parameter, value|
      if not value.empty? and consulta.respond_to? parameter
        consulta = consulta.send(parameter, value) 
      end
    end
    consulta
  end

end