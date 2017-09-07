class FotosController < ApplicationController
  before_action :set_foto, only: [:destroy]
  before_action :authenticate_usuario!

  def create
    @foto = Foto.new(foto_params)
    @foto.save
    @fotos = Foto.where('imovel_id =?', @foto.imovel_id).order(created_at: :desc)
  end

  def destroy
    @foto.destroy
    @fotos = Foto.where('imovel_id =?', @foto.imovel_id).order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foto
      @foto = Foto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foto_params
      params.require(:foto).permit(:legenda, :imovel_id, :img)
    end
end
