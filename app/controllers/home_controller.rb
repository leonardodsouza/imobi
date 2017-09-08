class HomeController < ApplicationController
  
  def index
    @visitante = Visitante.new
    @imoveis = Imovel.all.order(created_at: :desc).limit(9)
    @autoplayers = Imovel.all.order(created_at: :desc).limit(20)
    @destaques = Destaque.all.order(created_at: :desc).limit(3)
    @categorias = Categoria.all.order(:nome)
  end

end


