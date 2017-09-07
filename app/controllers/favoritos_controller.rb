class FavoritosController < ApplicationController
  before_action :set_favorito, only: [:show, :destroy]

  # GET /favoritos
  # GET /favoritos.json
  def index
    @favoritos = Favorito.where('email = ?', cookies[:email]).order(created_at: :desc)
  end

  # estou usando o método edit para no lugar do new
  def edit
    @favorito = Favorito.new
    @favorito.imovel_id = params[:id]
  end

  # POST /favoritos
  # POST /favoritos.json
  def create
    @favorito = Favorito.new(favorito_params)
    cookies.permanent[:email] = @favorito.email
    cookies.permanent[:nome] = @favorito.nome
    @link = imovel_url(@favorito.imovel_id)
    EmailsMailer.favoritos(@favorito, @link).deliver_now
  end

  # DELETE /favoritos/1
  # DELETE /favoritos/1.json
  def destroy
    @favorito.destroy
    respond_to do |format|
      format.html { redirect_to favoritos_url, notice: 'Favorito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorito
      @favorito = Favorito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorito_params
      params.require(:favorito).permit(:imovel_id, :nome, :email)
    end
end
