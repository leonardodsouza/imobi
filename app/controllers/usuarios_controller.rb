class UsuariosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_usuario, only: [:destroy]

  def index
    @usuarios = Usuario.all.order(:nome)
  end
  
  def destroy
    if @usuario.id != 1
      @usuario.destroy
      respond_to do |format|
        format.html { redirect_to usuarios_url, notice: 'Usuário apagado. ' }
        format.json { head :no_content }
      end
    else
      redirect_to usuarios_url, notice: 'Usuário não pode ser apagado. '
    end
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
end
